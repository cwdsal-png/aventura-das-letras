extends "res://tests/acceptance.gd"

func run():
 data=root.get_node("Data")
 data.save_path="res://../evidence/family-profiles-progress.json"
 data.migration_source=""
 # Isolate this test completely from previous evidence.
 data.state.selected_profile="filha"
 data.state.profiles={}
 for id in data.FAMILY_PROFILE_IDS:
  data.state.profiles[id]=data.fresh_profile()
 check(data.FAMILY_PROFILE_IDS==["filha","papai","mamae","convidado"],"four family and guest profiles available")
 check(data.SELECTABLE_CHARACTER_INDICES==[1,2,3],"three placeholder characters selected")
 check(data.state.profiles.size()==4,"each player has a separate progress record")
 data.choose_stage("silabas_b")
 data.record_answer(data.activities[0].id,"BA",true,false,"buttons")
 var daughter_before=data.profile().duplicate(true)
 data.select_profile("papai")
 check(data.profile().stage_id=="alfabeto_01" and data.profile().attempts.is_empty(),"father starts without daughter's discoveries")
 data.choose_stage("silabas_c")
 data.select_profile("mamae")
 check(data.profile().stage_id=="alfabeto_01","mother has own starting phase")
 data.select_profile("convidado")
 check(data.profile().stage_id=="alfabeto_01","guest starts separately")
 data.choose_stage("silabas_b")
 data.record_answer(data.activities[0].id,"BA",true,false,"buttons")
 check(data.save_progress(),"all four profiles are persisted")
 var guest_snapshot=data.profile().duplicate(true)
 data.load_progress()
 check(data.profile()==guest_snapshot,"guest progress survives a reload")
 var others={}
 for id in ["filha","papai","mamae"]:
  others[id]=data.state.profiles[id].duplicate(true)
 check(data.reset_guest_progress(),"guest restart succeeds when guest is selected")
 check(data.profile().stage_id=="alfabeto_01" and data.profile().attempts.is_empty() and data.profile().completed_stages.is_empty(),"guest restart returns to beginning")
 for id in others:
  check(data.state.profiles[id]==others[id],id+" data unaffected by guest restart")
 data.select_profile("filha")
 check(data.profile()==daughter_before,"daughter progress survives guest reset")
 check(not data.reset_guest_progress(),"guest reset rejects other active profiles")
 data.select_profile("convidado")
 data.load_progress()
 check(data.profile().stage_id=="alfabeto_01" and data.profile().attempts.is_empty(),"restarted guest persists after reload")
 main=load("res://scenes/main.tscn").instantiate()
 root.add_child(main)
 await frames(3)
 check(main.screen=="menu","new family selection menu opens")
 check(main.menu.profile_buttons.size()==4 and main.menu.character_buttons.size()==3,"four profile buttons and three character choices visible")
 check(main.menu.guest_reset_button.visible,"guest restart is visible for guest")
 main.menu.guest_reset_button.pressed.emit()
 await frames(3)
 check(main.screen=="guest_reset_confirmation","guest restart requires confirmation")
 var cancel=main.menu_buttons.filter(func(b):return b.text=="Cancelar")
 check(cancel.size()==1,"guest reset has cancel control")
 if not cancel.is_empty():cancel[0].pressed.emit()
 await frames(3)
 check(main.screen=="menu" and data.profile().stage_id=="alfabeto_01","cancel leaves guest state unchanged")
 var report={"passed":failures.is_empty(),"passes":passes,"failures":failures,"physical_hardware_tested":false}
 var output=FileAccess.open("res://../evidence/family-profiles-tests.json",FileAccess.WRITE)
 output.store_string(JSON.stringify(report,"  "))
 output.close()
 print("FAMILY PROFILES: ",passes.size()," passed; ",failures.size()," failed")
 main.queue_free()
 await frames(2)
 quit(0 if failures.is_empty() else 1)

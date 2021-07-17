ask(Patient, Question, Symptom):-
    write(Patient), write(", do you"), write(Question), write("? "),
    read(N),
    ((N == yes ; N == y) -> 
        assert(yes(Question, Symptom)); 
        assert(no(Question, Symptom)), fail).

:- dynamic 
        yes/2,
        no/2,
        patient_has_a/2,
        patient_symptom/2.	

verify(P,S,A) :-
    (yes(S,A) -> true ; (no(S,A) -> fail ; ask(P,S,A))).

undo :- retract(yes(_,_)),fail. 
undo :- retract(no(_,_)),fail.
undo.

% DISINI KALO MAU NAMBAHIN GEJALA 
symptom(Patient, fatigue):-
    verify(Patient, " experience weakness and feeling tired (fatigue) (y/n) ?",fatigue).

symptom(Patient, pain_in_the_belly):-
    verify(Patient, " have pain in the belly (y/n) ?", pain_in_the_belly).

symptom(Patient, yellowing_of_skin_and_eyes):-
    verify(Patient, " experience yellowing of the skin and eyes (y/n) ?", yellowing_of_skin_and_eyes).
    
symptom(Patient, weight_loss):-
    verify(Patient, " experience weight loss (y/n) ?", weight_loss).
     
symptom(Patient, nausea_and_vomiting):-
    verify(Patient, " have nausea and vomiting (y/n) ?", nausea_and_vomiting).
    
symptom(Patient, diarrhea):-
    verify(Patient, " have diarrhea (y/n) ?", diarrhea).
    
symptom(Patient, constipation):-
    verify(Patient, " have constipation (y/n) ?",constipation).
    
symptom(Patient, bloating_and_gas):-
    verify(Patient, " have bloating and gas (y/n) ?", bloating_and_gas).

symptom(Patient, severe_pain_in_the_belly):-
    verify(Patient, " have severe pain in the belly (y/n) ?", severe_pain_in_the_belly).
    
symptom(Patient, dark_colored_stools):-
    verify(Patient, " have Dark-colored stools (y/n) ?", dark_colored_stools).
    
symptom(Patient, low_red_blood_cell_counts):-
    verify(Patient, " have low red blood cell counts (y/n) ?", low_red_blood_cell_counts).
    
symptom(Patient, blood_in_your_stool):-
    verify(Patient, " have blood in your stool (y/n) ?", blood_in_your_stool).
    
symptom(Patient, mouth_sores):-
    verify(Patient, " experience mouth sores (y/n) ?", mouth_sores).
    
symptom(Patient, fever):-
    verify(Patient, " have fever (y/n) ?", fever).
    
symptom(Patient, loud_bowel_sounds):-
    verify(Patient, " have loud bowel sounds (y/n) ?", loud_bowel_sounds).
    
symptom(Patient, swelling_of_the_abdomen):-
    verify(Patient, " experience swelling of the abdomen (y/n) ?", swelling_of_the_abdomen).

symptom(Patient, loss_of_appetite):-
    verify(Patient, " lose your appetite (y/n) ?", loss_of_appetite).

symptom(Patient, painful_pee):-
    verify(Patient, " experience painful pee (y/n) ?", painful_pee).

symptom(Patient, cant_pass_gas) :-
    verify(Patient, " have difficulty to pass gas (y/n) ?", cant_pass_gas).

symptom(Patient, hiccup):-
    verify(Patient, "have hiccup (y/n) ?", hiccup).

symptom(Patient, pain_upper_abdomen):-
    verify(Patient, " have pain in your upper abdomen (y/n) ?", pain_upper_abdomen).

symptom(Patient, heartburn):-
    verify(Patient, " experience heartburn (y/n) ?", heartburn).
    
% NAMBAHIN PENYAKIT BARU NI DISINI 
hypothesis(Patient, intestinal_cancer):-
    % writeln("MASUK INTESTINAL CANCER"),
    symptom(Patient, pain_in_the_belly),
    symptom(Patient, nausea_and_vomiting),
    symptom(Patient, weight_loss),
    symptom(Patient, fatigue),
    symptom(Patient, dark_colored_stools),
    symptom(Patient, low_red_blood_cell_counts),
    symptom(Patient, yellowing_of_skin_and_eyes).

hypothesis(Patient, crohns_disease):-
    % writeln("MASUK CROHNS"),nl,
    symptom(Patient, diarrhea),
    symptom(Patient, fever),
    symptom(Patient, fatigue),
    symptom(Patient, blood_in_your_stool),
    symptom(Patient, mouth_sores),
    symptom(Patient, weight_loss),
    symptom(Patient, yellowing_of_skin_and_eyes).
                          
hypothesis(Patient, celiac_disease):-
    % writeln("MASUK CELIAC"),nl,
    symptom(Patient, diarrhea),
    symptom(Patient, fatigue),
    symptom(Patient, weight_loss),
    symptom(Patient, bloating_and_gas),
    symptom(Patient, pain_in_the_belly),
    symptom(Patient, nausea_and_vomiting),
    symptom(Patient, constipation).

hypothesis(Patient, intestinal_obstruction):-
    % writeln("MASUK INTESTINAL OBSTRUCTION"),nl,
    symptom(Patient, severe_pain_in_the_belly),
    symptom(Patient, nausea_and_vomiting),
    symptom(Patient, bloating_and_gas),
    symptom(Patient, loud_bowel_sounds),
    symptom(Patient, swelling_of_the_abdomen),
    symptom(Patient, constipation).

hypothesis(Patient, appendicities):-
    % writeln("MASUK appendicities"),nl,
    symptom(Patient, loss_of_appetite),
    symptom(Patient, pain_in_the_belly),
    symptom(Patient, swelling_of_the_abdomen),
    symptom(Patient, nausea_and_vomiting),
    symptom(Patient, fever),
    symptom(Patient, cant_pass_gas),
    symptom(Patient, painful_pee),
    symptom(Patient, diarrhea).

hypothesis(Patient, gastritis):-
    % writeln("MASUK gastritis"),nl,
    symptom(Patient, nausea_and_vomiting),
    symptom(Patient, pain_upper_abdomen),
    symptom(Patient, loss_of_appetite),
    symptom(Patient, heartburn),
    symptom(Patient, hiccup),
    symptom(Patient, bloating_and_gas).

% DISINI BUAT NAMBAHIN PERAWATAN DARI PENYAKIT 
treatment(intestinal_cancer):-
    nl,
    write("\tThe treatments are surgery, radiation therapy, or chemotherapy").

treatment(crohns_disease):-
    nl,
    write("\tCrohn's disease cannot be cured. Medications such as steroids and 
           immunosuppressants are used to slow the progression of disease.").

treatment(celiac_disease):-
    nl,
    write("\tA gluten-free diet will allow the small intestine to heal").

treatment(intestinal_obstruction):-
    nl,
    write("\tTreatment includes avoiding solid foods, 
            using pain and nausea medication and close monitoring.").

treatment(appendicities):-
    nl,
    write("\tTreatment include surgical removal of the appendix, 
            and use antibiotics").

treatment(gastritis):-
    nl,
    write("\t Antibiotic medications to kill H. pylori, 
            Medications that block acid production and promote healing,
            Medications to reduce acid production,
            Antacids that neutralize stomach acid").
        
% query deteksi penyakit dari gejala
assert_all_symptom(Patient):-
    forall(yes(_,Symptom),assert(patient_symptom(Patient,Symptom))).
check_disease:-
    write("What is the name of the Patient? "), read(Patient),
    hypothesis(Patient, Disease), assert(patient_has_a(Patient, Disease)), assert_all_symptom(Patient), nl, 
    write("Disease : \n\t"), 
        write(Patient), write(" probably has "), write(Disease), nl,
    write("Treatment :"), 
        treatment(Disease),  nl,nl.
check_disease:-
    write("Sorry, I don't seem to be able to"),nl,
    write("diagnose the disease."),nl.


% query mastiin penyakit 
verify_disease:-
    writeln("These are diseases that you can verify : "),
    writeln("\t1. Intestinal cancer"),
    writeln("\t2. Chrons disease"),
    writeln("\t3. Celiac disease"),
    writeln("\t4. Intestinal obstruction"),
    writeln("\t5. Appendicities"),
    writeln("\t6. Gastritis"),
    
    write("Insert the disease that you suspected you're having (1,2,3,4,5,6) : "), read(Disease), nl, 
    ((Disease == 1) -> 
        (hypothesis("Patient", intestinal_cancer) -> 
            writeln("\nPatient you are verified to have intestinal cancer"), write("Treatment :"), treatment(intestinal_cancer), nl, nl;
            writeln("\nPatient you are not verified to have intestinal cancer"), nl)
        ; true),
    ((Disease == 2) -> 
        (hypothesis("Patient", crohns_disease) -> 
            writeln("\nPatient you are verified to have crohns disease"), write("Treatment :"), treatment(crohns_disease), nl, nl;
            writeln("\nPatient you are not verified to have crohns disease"), nl)
        ; true),
    ((Disease == 3) -> 
        (hypothesis("Patient", celiac_disease) -> 
            writeln("\nPatient you are verified to have celiac disease"), write("Treatment :"), treatment(celiac_disease), nl, nl;
            writeln("\nPatient you are not verified to have celiac disease"), nl)
        ; true),
    ((Disease == 4) -> 
        (hypothesis("Patient", intestinal_obstruction) -> 
            writeln("\nPatient you are verified to have intestinal obstruction"), write("Treatment :"), treatment(intestinal_obstruction), nl, nl;
            writeln("\nPatient you are not verified to have intestinal obstruction"), nl)
        ; true),
    ((Disease == 5) -> 
        (hypothesis("Patient", appendicities) -> 
            writeln("\nPatient you are verified to have appendicities"), write("Treatment :"), treatment(appendicities), nl, nl;
            writeln("\nPatient you are not verified to have appendicities"), nl)
        ; true),
    ((Disease == 6) -> 
        (hypothesis("Patient", gastritis) -> 
            writeln("\nPatient you are verified to have gastritis"), write("Treatment :"), treatment(gastritis), nl, nl;
            writeln("\nPatient you are not verified to have gastritis"), nl)
        ; true).


% query print penyakit pasien 
write_format(Y):-
    write("\t"), writeln(Y).
write_patient_symptom(X):-
    write(X), writeln("'s symptoms:"),
        forall(patient_symptom(X,Y), write_format(Y)).
write_patient_disease(X,Y):-
    write("Disease : \n\t"),
        write(X), write(" has a "), write(Y), nl, nl, 
    write("Treatment :"), 
        treatment(Y), nl, nl, 
    write_patient_symptom(X), nl, nl.
print_patient_disease:-
    write("Enter patient's name : "), read(X), nl,
   (patient_has_a(X,_) -> forall(patient_has_a(X,Y), write_patient_disease(X,Y)) ; write(X), writeln(" haven't sick yet :)")). 


% query nunjukin semua pasien yang derita sebuah penyakit 
print_all_penderita:-
    writeln("These are diseases that you can check : "),
    writeln("\t1. Intestinal cancer"),
    writeln("\t2. Chrons disease"),
    writeln("\t3. Celiac disease"),
    writeln("\t4. Intestinal obstruction"),
    writeln("\t5. Appendicities"),
    writeln("\t6. Gastritis"),
    write("Insert the disease (1,2,3,4,5,6) : "), read(Disease), nl,
    ((Disease == 1) -> 
        patient_has_a(_, intestinal_cancer) -> 
            (write("The people who got Intestinal Cancer are : "), forall( patient_has_a(X, intestinal_cancer),( write("\n\t"), write(X) ) ), nl, nl ;  
            writeln("There are no people that got this disease yet"))
        ; true),
    ((Disease == 2) -> 
        patient_has_a(_, crohns_disease) -> 
            (write("The people who got Crohns Disease are : "), forall( patient_has_a(X, crohns_disease),( write("\n\t"), write(X) ) ), nl, nl ;  
            writeln("There are no people that got this disease yet"))
        ; true),
    ((Disease == 3) -> 
        patient_has_a(_, celiac_disease) -> 
            (write("The people who got Celiac Disease are : "), forall( patient_has_a(X, celiac_disease),( write("\n\t"), write(X) ) ), nl, nl ;  
            writeln("There are no people that got this disease yet"))
        ; true),
    ((Disease == 4) -> 
        patient_has_a(_, intestinal_obstruction) -> 
            (write("The people who got Intestinal Obstruction are : "), forall( patient_has_a(X, intestinal_obstruction),( write("\n\t"), write(X) ) ), nl, nl ;  
            writeln("There are no people that got this disease yet"))
        ; true),
    ((Disease == 5) -> 
        patient_has_a(_, appendicities) -> 
            (write("The people who got appendicities are : "), forall( patient_has_a(X, appendicities),( write("\n\t"), write(X) ) ), nl, nl ;  
            writeln("There are no people that got this disease yet"))
        ; true),
    ((Disease == 6) -> 
        patient_has_a(_, gastritis) ->
            (write("The people who got gastritis are : "), forall( patient_has_a(X, gastritis),( write("\n\t"), write(X) ) ), nl, nl ;  
            writeln("There are no people that got this disease yet"))
        ; true).
    

% query ui UWADIDAWW
greetings:-
    writeln("WELCOME TO SEHAT APP !\n"),
    writeln("Here are the list of what this program can do:"),
    writeln("1. Try to diagnoze your disease"),    
    writeln("2. Try to ensure you what your disease is"),    
    writeln("3. Look for a patient's history"),
    writeln("4. Show all patient who got a disease\n").

ask_continue:-
    write("Do you want to continue ? (y/n) : "), read(Continue), write("\n"),
    ((Continue == y) -> homepage ; true),
    ((Continue == n) -> halt ; true),
    ((Continue \== n ; Continue \== y) -> writeln("Please write y or n"),  ask_continue ; true).

homepage:-
    greetings,
    writeln("What do you want to do? (type number 1/2/3/4)"),
    write("query : "), read(Query), nl,
    ((Query == 1) -> check_disease ; true),
    ((Query == 2) -> verify_disease ; true),
    ((Query == 3) -> print_patient_disease ; true),
    ((Query == 4) -> print_all_penderita ; true),
    undo,
    ask_continue.
    
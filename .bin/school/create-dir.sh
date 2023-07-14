#!/bin/sh

school_dir="$HOME/Documents/school/"

subjects=(Math Science English Research Electronics AP Esp Filipino MAPEH)
quarters=(1st 2nd 3rd 4th)

getSubjects(){
    echo -e "Total Subjects (${#subjects[*]})";
    echo "${subjects[*]}" |
        xargs -n 1 |
        sort |
        awk 'NR==1, NR=='"${#subjects[*]}"'{print NR".",$0}';
}

createDir(){
    ### Creating a new folder called school in the school path
    test -d "$school_dir" && echo " Folder already exists. Skipping..." || { echo " Creating the School folder..."; mkdir "$school_dir"; }

    ### Check if all the quarters are already created.
    for i in ${quarters[*]}; do
        test -d "$school_dir${i} Quarter" && echo " Folder already exists. Skipping..." || 
        { echo " Creating quarterly directories..."; mkdir "$school_dir${i} Quarter"; }
    done

    ### Check if the subjects are already created.
    for i in ${subjects[*]}; do
        for c in ${quarters[*]}; do
            test -d "$school_dir${c} Quarter/${i}" && echo " Folder already exists. Skipping..." ||
            { echo " Creating ${i} directories in each quarters..."; mkdir "$school_dir${c} Quarter/${i}"; }
        done
    done
}

createDir | uniq

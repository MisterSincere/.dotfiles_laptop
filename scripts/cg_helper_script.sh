#!/usr/bin/env bash

cmd="clone"
if (( $# > 0 )); then
  cmd=$1
fi
rep_prefix="gogs@git.cg.cs.tu-bs.de:CG1_WS2122/"
groups=("group_01" "group_02" "group_03" "group_05" "group_06" "group_08" "group_09" "group_10" "group_11" "group_12" "group_13" "group_14" "group_15" "group_17")
hws=("2021-11-09" "2021-11-26" "2021-12-03" "2021-12-10" "2021-12-17" "2022-01-14")
exercises=("ex1" "ex2" "ex3" "ex4" "ex5" "ex6" "ex7" "ex8" "ex9" "ex10" "ex11" "ex12")

pushd ~/programming &>/dev/null
for i in "${groups[@]}"
do
  if [ $cmd == "clone" ]; then
    echo "----- Cloning ${i} -----"
    git clone ${rep_prefix}${i}.git

  elif [ $cmd == "pull" ]; then 
    pushd ~/programming/${i} &>/dev/null

    if (( $# > 1 )); then
      deadline=${hws[$(($2 - 1))]}
      deadline_unix=$(date -d $deadline"T09:45:00" +%s)
      echo "----- ${i} checkout before ${deadline} / ${deadline_unix} -----"

      commits=$(git log master --format='%at,%H')
      unset commit_list
      IFS=$'\n' read -d "\034" -r -a commit_list <<<"${commits}\034"
      num_elements=${#commit_list[@]}
      for (( j=0; j<=$num_elements; j++ ))
      do
        cur_timestamp=$(echo ${commit_list[$j]} | awk -F ',' '{ print $1 }')
        if (( $cur_timestamp < $deadline_unix )); then
          commit=$(echo ${commit_list[$j]} | awk -F ',' '{ print $2 }')
          git checkout ${commit}
          break
        fi
      done
    fi
    popd &>/dev/null

  elif [ $cmd == "datalink" ]; then
    pushd ~/programming/${i} &>/dev/null
    echo "----- Create data links for ${i} -----"
    ln -f ~/programming/data/* data/.
    popd &>/dev/null
    
  elif [ $cmd == "resultlink" ]; then
    echo "----- Create result image link for ${i} -----"
    mkdir -p ~/programming/${i}/build
    if [[ -f ~/programming/${i}/build/result.png ]]; then
      ln -f ~/programming/${i}/build/result.png ~/programming/results/${i}.png
    fi

  elif [ $cmd == "checkout" ]; then
    echo "----- Checking out for ${i} -----"
    pushd ~/programming/${i} &>/dev/null
    git checkout .
    popd &>/dev/null

  elif [ $cmd == "datapath" ]; then
    echo "----- Correcting datapath for ${i} -----"
    pushd ~/programming/${i} &>/dev/null
    for f in "${exercises[@]}"
    do
      if [[ -f ${f}.cpp ]]; then
        sed -i "s/(\"data\//(\"..\/data\//g" ${f}.cpp
      fi
    done
    popd &>/dev/null

  elif [ $cmd == "build" ]; then
    echo "----- Building ${i} -----"
    mkdir -p ~/programming/${i}/build &>/dev/null
    pushd ~/programming/${i}/build &>/dev/null
    echo "- Running CMake to generate Ninja"
    cmake .. -G "Ninja" &>/dev/null
    target="tracey_ex1"
    if (( $# > 1 )); then
      target="tracey_ex$2"
    fi
    ninja ${target}
    popd &>/dev/null

  elif [ $cmd == "run" ]; then
    target="tracey_ex1"
    if (( $# > 1 )); then
      target="tracey_ex$2"
    fi

    echo "----- Running ${target} of ${i} -----"
    
    pushd ~/programming/${i}/build &>/dev/null
    ./${target}
    popd &>/dev/null


  elif [ $cmd == "tmp" ]; then
    echo "----- Tmp action for ${i} -----"
    rm -rf ~/programming/${i}/cmake-build-debug

  else
    echo "----- ${i} no clue -----"
  fi
  echo ""
done
popd &>/dev/null

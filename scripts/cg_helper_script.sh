#!/usr/bin/env bash

root_dir="$HOME/programming"

rep_prefix="gogs@git.cg.cs.tu-bs.de:CG1_WS2122/"
groups=("group_01" "group_02" "group_03" "group_05" "group_06" "group_07" "group_08" "group_09" "group_10" "group_11" "group_12" "group_13" "group_14" "group_15")
hws=("2021-11-09" "2021-11-26" "2021-12-03" "2021-12-10" "2021-12-17" "2022-01-14")
exercises=("ex1" "ex2" "ex3" "ex4" "ex5" "ex6" "ex7" "ex8" "ex9" "ex10" "ex11" "ex12")

cmd="clone"
if (( $# > 0 )); then
  cmd=$1
fi

unset args
IFS=$' ' read -d "\034" -r -a args <<<"$@\034"
for (( i=1; i<$#; i++ ))
do
  var=${args[$i]}
  if [ $var == "-x" ];
  then
    par=${args[$(($i + 1))]}
    groups=( "${groups[@]/$par}" )
  fi
done

pushd ${root_dir} &>/dev/null
for i in "${groups[@]}"
do
  if [ $cmd == "clone" ]; then
    pushd ${root_dir} &>/dev/null

    echo "----- Cloning ${i} -----"
    git clone ${rep_prefix}${i}.git

    popd &>/dev/null

  elif [ $cmd == "pull" ]; then 
    pushd ${root_dir}/${i} &>/dev/null

    if (( $# > 1 )); then
      deadline=${hws[$(($2 - 1))]}
      deadline_unix=$(date -d $deadline"T09:45:00" +%s)
      echo "----- ${i} checkout before ${deadline} / ${deadline_unix} -----"

      branch_name="master"
      has_master=$(git branch | grep master | wc -l)
      if [[ $has_master == 0 ]]; then
        branch_name="main"
      fi

      commits=$(git log ${branch_name} --format='%at,%H')
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
    pushd ${root_dir}/${i} &>/dev/null
    echo "----- Create data links for ${i} -----"
    ln -f ${root_dir}/data/* data/.
    popd &>/dev/null
    
  elif [ $cmd == "resultlink" ]; then
    echo "----- Create result image link for ${i} -----"
    mkdir -p ${root_dir}/${i}/build
    mkdir ${root_dir}/results &>/dev/null
    if [[ -f ${root_dir}/${i}/build/result.png ]]; then
      ln -f ${root_dir}/${i}/build/result.png ${root_dir}/results/${i}.png
    fi

  elif [ $cmd == "checkout" ]; then
    echo "----- Checking out for ${i} -----"
    pushd ${root_dir}/${i} &>/dev/null
    git checkout .
    popd &>/dev/null

  elif [ $cmd == "datapath" ]; then
    echo "----- Correcting datapath for ${i} -----"
    pushd ${root_dir}/${i} &>/dev/null
    for f in "${exercises[@]}"
    do
      if [[ -f ${f}.cpp ]]; then
        sed -i "s/(\"data\//(\"..\/data\//g" ${f}.cpp
      fi
    done
    popd &>/dev/null

  elif [ $cmd == "build" ]; then
    echo "----- Building ${i} -----"
    mkdir -p ${root_dir}/${i}/build &>/dev/null
    pushd ${root_dir}/${i}/build &>/dev/null
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
    
    pushd ${root_dir}/${i}/build &>/dev/null
    ./${target}
    popd &>/dev/null


  elif [ $cmd == "tmp" ]; then
    echo "----- Tmp action for ${i} -----"
    rm -rf ${root_dir}/${i}/cmake-build-debug

  else
    echo "----- ${i} no clue -----"
  fi
  echo ""
done
popd &>/dev/null

#!/bin/bash -i

datasets=(
  "habibi2022"
  "leung2021"
  "prussin2019"
  "wang2023"
  "roasrio2018"
)

datasets=(
  "roasrio2018"
)

data_dir="s3://nao-harmon/lenni"

for dataset in "${datasets[@]}"; do
  output="${dataset}/analysis/data"
  #mkdir -p "${output}"

  input=${output}/input/
  mkdir ${input}
  results=${output}/results/
  mkdir ${results}

  aws s3 sync "${data_dir}/${dataset}/output/input/" "${input}/" 
  aws s3 sync "${data_dir}/${dataset}/output/results/" "${results}/" 
done

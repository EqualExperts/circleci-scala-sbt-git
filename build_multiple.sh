#!/usr/bin/env bash
scala_versions=(
  2.11.11
  2.12.2
  2.12.3
)
sbt_versions=(
  0.13.15
  0.13.16
  1.0.1
)

for scala_version in ${scala_versions[@]}; do
  for sbt_version in ${sbt_versions[@]}; do
    version=scala-${scala_version}-sbt-${sbt_version}
    docker build \
      -t codestar/circleci-scala-sbt-git:${version} \
      --build-arg SCALA_VERSION=${scala_version} \
      --build-arg SBT_VERSION=${sbt_version} \
      .
    docker push codestar/circleci-scala-sbt-git:${version}
    echo "Built ${version}"
  done
done

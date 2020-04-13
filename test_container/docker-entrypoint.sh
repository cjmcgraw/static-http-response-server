#! /usr/bin/env bash
echo "finding all tests associated with: $tests_to_find"
tests_to_run=$(ls "/app/" | grep '.*\.py$')
echo "running over all tests: $tests_to_run"
run_directory="/app/runs/$(date +%s)"
mkdir -p "$run_directory"
echo "saving to run directory at $run_directory"

for test in $tests_to_run; do
    echo "running test: $test"
    python $test | tee $run_directory/$(echo "$test" | sed 's/.py$/.log/')
    echo "finished running $test"
done

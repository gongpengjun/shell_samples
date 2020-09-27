string='./run_unit_test.sh'
if ! [[ $string == "tools/"* ]]; then
    echo "It's wrong!"
    script_name=`basename "${string}"`
    #echo script_name: ${script_name}
    echo "e.g.: tools/${script_name} voip-signal.call-flows.accept-test"
else
    echo "It's right"
fi

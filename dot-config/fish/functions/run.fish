function run
    if test -e "./main.go"
        commandline -r "go run ."
        commandline -f execute
    end
end

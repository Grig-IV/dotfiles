function fish_prompt
    if type -q plato
        plato
    else
        printf "\n   > "
    end
end

local used_science = {}

for _, tech in pairs(data.raw["technology"]) do
    if tech.max_level and tech.max_level == "infinite" then
        for _, ingredient in ipairs(tech.unit.ingredients) do
            if ingredient[1] ~= "space-science-pack" then
                ingredient[1] = "infused-" .. ingredient[1]
                used_science[ingredient[1]] = true
            end
        end
        table.insert(tech.prerequisites, "is-infused-science")
    end
end

for scienceName,_ in pairs(data.raw["tool"]) do
    if scienceName:sub(1,8) == "infused-" then
        if used_science[scienceName] then
            table.insert(data.raw["technology"]["is-infused-science"].effects, {type = "unlock-recipe", recipe = scienceName})
            table.insert(data.raw["lab"]["is-infusion-lab"].inputs, scienceName)
        else
            data.raw["tool"][scienceName] = nil
            data.raw["recipe"][scienceName] = nil
        end
    end
end

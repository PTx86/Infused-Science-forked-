data:extend({
    {
        type = "recipe",
        name = "is-ore-mixture",
        category = "chemistry",
        energy_required = 5,
        enabled = false,
        ingredients =
        {
            {type="item", name="iron-ore", amount=3},
            {type="item", name="copper-ore", amount=3},
            {type="item", name="stone", amount=2},
            {type="item", name="coal", amount=2},
            {type="fluid", name="water", amount=50}
        },
        results=
        {
            {type="fluid", name="is-ore-mixture", amount=50}
        },
        subgroup = "fluid-recipes"
    },
    {
        type = "recipe",
        name = "is-ore-oil-mixture",
        category = "chemistry",
        energy_required = 5,
        enabled = false,
        ingredients =
        {
            {type="item", name="uranium-ore", amount=2},
            {type="fluid", name="crude-oil", amount=25},
            {type="fluid", name="is-ore-mixture", amount=75}
        },
        results=
        {
            {type="fluid", name="is-ore-oil-mixture", amount=100}
        },
        subgroup = "fluid-recipes"
    },
    {
        type = "recipe",
        name = "is-infusion-fluid",
        category = "chemistry",
        energy_required = 10,
        enabled = false,
        ingredients =
        {
            {type="item", name="space-science-pack", amount=1},
            {type="fluid", name="is-ore-oil-mixture", amount=100}
        },
        results=
        {
            {type="fluid", name="is-infusion-fluid", amount=100}
        },
        subgroup = "fluid-recipes"
    }
})

local infusionLab = {
    type = "recipe",
    name = "is-infusion-lab",
    category = "crafting-with-fluid",
    energy_required = 10,
    result = "is-infusion-lab",
    enabled = false
}

if mods["one-more-tier"] and data.raw["item"]["omt-lab"] then
    infusionLab.ingredients = {
        {"processing-unit", 6},
        {"electronic-circuit", 35},
        {"iron-gear-wheel", 70},
        {"express-transport-belt", 14},
        {"low-density-structure", 40},
        {"omt-lab", 1},
        {type="fluid", name="is-infusion-fluid", amount=100}
    }
else
    infusionLab.ingredients = {
        {"processing-unit", 10},
        {"electronic-circuit", 50},
        {"iron-gear-wheel", 100},
        {"express-transport-belt", 20},
        {"low-density-structure", 50},
        {"lab", 1},
        {type="fluid", name="is-infusion-fluid", amount=100}
    }
end

data:extend({infusionLab})

if mods["AlienSpaceScience"] then
    data:extend({{
        type = "recipe",
        name = "is-infusion-fluid-artifact",
        category = "chemistry",
        energy_required = 20,
        enabled = false,
        ingredients =
        {
            {type="item", name="space-science-pack", amount=1},
            {type="item", name="alien-artifact", amount=1},
            {type="fluid", name="is-ore-oil-mixture", amount=300}
        },
        results=
        {
            {type="fluid", name="is-infusion-fluid", amount=300}
        },
        subgroup = "fluid-recipes"
    }})
end

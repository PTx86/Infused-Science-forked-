data:extend({
    {
        type = "technology",
        name = "is-infusion-fluid",
        icon_size = 64,
        icon = "__infused-science__/graphics/technology/infusion-fluid.png",
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "is-ore-mixture"
            },
            {
                type = "unlock-recipe",
                recipe = "is-ore-oil-mixture"
            },
            {
                type = "unlock-recipe",
                recipe = "is-infusion-fluid"
            }
        },
        unit =
        {
            count = 1000,
            ingredients =
            {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
                {"space-science-pack", 1}
            },
            time = 30
        },
        prerequisites = {"space-science-pack"},
        order = "c-a"
    },
    {
        type = "technology",
        name = "is-infused-science",
        icon_size = 128,
        icon = "__infused-science__/graphics/technology/infused-science.png",
        effects = {
            {
                type = "unlock-recipe",
                recipe = "is-infusion-lab"
            }
        },
        unit =
        {
            count = 1000,
            ingredients =
            {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
                {"space-science-pack", 1}
            },
            time = 30
        },
        prerequisites = {"is-infusion-fluid"},
        order = "c-a"
    }
})

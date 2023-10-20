local function modify_lab_size(size) return math.floor((size * 4 / 3) + 0.5) end

local base_path = "__base__/graphics/entity/lab/"
local off_layers = {
    normal = {
        { base_path .. "lab.png", 98, 87 },
        { base_path .. "lab-integration.png", 122, 81 },
        { base_path .. "lab-shadow.png", 122, 68 },
    },
    hr = {
        { base_path .. "hr-lab.png", 194, 174 },
        { base_path .. "hr-lab-integration.png", 242, 162 },
        { base_path .. "hr-lab-shadow.png", 242, 136 },
    },
}
local on_layers = {
    normal = {
        { base_path .. "lab.png", 98, 87 },
        { base_path .. "lab-integration.png", 122, 81 },
        { base_path .. "lab-light.png", 106, 100 },
        { base_path .. "lab-shadow.png", 122, 68 },
    },
    hr = {
        { base_path .. "hr-lab.png", 194, 174 },
        { base_path .. "hr-lab-integration.png", 242, 162 },
        { base_path .. "hr-lab-light.png", 216, 192 },
        { base_path .. "hr-lab-shadow.png", 242, 136 },
    },
}

local function modify_lab_layers(layers)
    local base_layers = #layers == 3 and off_layers or on_layers
    for i, layer in ipairs(layers) do    
		layer.scale=4/3
		layer.hr_version.scale=4/3
		layer.shift = {layer.shift[1]*4/3,layer.shift[2]*4/3}
		layer.hr_version.shift = {layer.hr_version.shift[1]*4/3,layer.hr_version.shift[2]*4/3}
    end
end

local base_remnant_path = "__base__/graphics/entity/lab/remnants/"
local base_remnant_layers = {
    normal = { base_remnant_path .. "lab-remnants.png", 134, 100 },
    hr = { base_remnant_path .. "hr-lab-remnants.png", 266, 196 },
}

local function modify_lab_remnant_layers(layers)
    for _, layer in ipairs(layers) do
		layer.scale=4/3
		layer.hr_version.scale=4/3
		layer.shift = {layer.shift[1]*4/3,layer.shift[2]*4/3}
		layer.hr_version.shift = {layer.hr_version.shift[1]*4/3,layer.hr_version.shift[2]*4/3}
    end
end

local infusionLab = table.deepcopy(data.raw["lab"]["lab"])
infusionLab.name = "is-infusion-lab"
infusionLab.icon = "__infused-science-fixed__/graphics/icons/lab.png"
infusionLab.minable.result = "is-infusion-lab"
infusionLab.corpse = "is-infusion-lab-remnants"
infusionLab.energy_usage = "150kW"
infusionLab.researching_speed = 1.25
infusionLab.module_specification.module_slots = 4
infusionLab.inputs = { "space-science-pack" }
infusionLab.collision_box = { { -1.7, -1.7 }, { 1.7, 1.7 } }
infusionLab.selection_box = { { -2, -2 }, { 2, 2 } }
modify_lab_layers(infusionLab.on_animation.layers)
modify_lab_layers(infusionLab.off_animation.layers)

local infusionLabRemnants = table.deepcopy(data.raw["corpse"]["lab-remnants"])
infusionLabRemnants.name = "is-infusion-lab-remnants"
infusionLabRemnants.icon = "__infused-science-fixed__/graphics/icons/lab.png"
infusionLabRemnants.selection_box = { { -2, -2 }, { 2, 2 } }
infusionLabRemnants.tile_width = 4
infusionLabRemnants.tile_height = 4
modify_lab_remnant_layers(infusionLabRemnants.animation)

data:extend({ infusionLab, infusionLabRemnants })

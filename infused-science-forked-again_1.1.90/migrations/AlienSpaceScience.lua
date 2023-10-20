for _, force in pairs(game.forces) do
  force.reset_recipes()
  if force.recipes["space-science-pack"] then
      force.recipes["space-science-pack"].enabled = false
  end
end 

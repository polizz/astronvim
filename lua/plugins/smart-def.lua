return {
  "polizz/smart-def",
  event = "LspAttach",
  enabled = true,
  config = function()
    require("smart-def").setup()
  end
}

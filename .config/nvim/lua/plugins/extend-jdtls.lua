return {
  "mfussenegger/nvim-jdtls",
  opts =  {
    settings = {
      java = {
        inlayHints = {
          parameterNames = {
            enabled = "all",
          },
          referencesCodeLens = {
            enabled = true,
          },
          signatureHelp = {
            enabled = true,
          },
          implementationsCodeLens = {
            enabled = true,
          },

        },
      },
    },
  }
}

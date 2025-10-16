-- lua/plugins/nvim-jdtls.lua
return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function(ev)
          local jdtls = require("jdtls")
          local root = vim.fs.root(0, { "gradlew", "mvnw", ".git" }) -- add "pom.xml"/"build.gradle" if needed
          if not root then return end
          jdtls.start_or_attach({ cmd = { "jdtls" }, root_dir = root })

          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
          end
          map("n", "<A-o>", function() jdtls.organize_imports() end, "JDTLS organize imports")
          map("n", "crv", function() jdtls.extract_variable() end, "JDTLS extract variable")
          map("v", "crv", function() jdtls.extract_variable(true) end, "JDTLS extract variable (visual)")
          map("n", "crc", function() jdtls.extract_constant() end, "JDTLS extract constant")
          map("v", "crc", function() jdtls.extract_constant(true) end, "JDTLS extract constant (visual)")
          map("v", "crm", function() jdtls.extract_method(true) end, "JDTLS extract method (visual)")
        end,
      })
    end,
  },
}


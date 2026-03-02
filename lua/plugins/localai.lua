return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim", -- Optional but recommended
  },
  opts = {
      adapters = {
        http = {

          llamacpp = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              name = "llamacpp",

             env = {
                url = "http://127.0.0.1:8888",
                api_key = "PAVON_KEY",
                chat_url = "/v1/chat/completions",
             } ,
             schema = {
               model = {
                 default = "Qwen2.5-Coder-7B-Instruct-IQ4_XS",
               },
                temperature = { default = 0 },
                max_tokens = { default = 8192 },
             }

            })

          end,

        }
      },
      interactions = {
        chat = { adapter = "llamacpp" },
      },
      display = {
      }, 
      opts = {
        log_level = "TRACE",
        system_prompt = "You are an expert C developer and Linux specialist with LFS focus. Focus on memory safety, " ..
                      "correct pointer arithmetic, and modern C11/C17 standards. " ..
                      "Always suggest header guards and check for NULL pointers."
      },

    }
    
}




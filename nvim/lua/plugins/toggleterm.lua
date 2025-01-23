return {
  {
    "akinsho/toggleterm.nvim",
    version = "*", -- Usa la última versión estable
    config = function()
      require("toggleterm").setup({
        size = 20, -- Tamaño predeterminado
        open_mapping = [[<C-\>]], -- Mapeo para abrir/cerrar la terminal
        direction = "horizontal", -- Dirección de la terminal
        close_on_exit = true, -- Cierra la terminal al salir
        shell = vim.o.shell, -- Usa la shell predeterminada del sistema
        float_opts = {
          border = "curved", -- Bordes de la terminal flotante
        },
      })
    end,
  },
}

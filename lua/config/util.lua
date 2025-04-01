local M = {}

-- Exemplo de função get_root
function M.get_root()
    return vim.fn.getcwd()  -- Retorna o diretório atual de trabalho
end

-- Exemplo de função float_term
function M.float_term(cmd, opts)
    opts = opts or {}
    local term_opts = {
        size = opts.size or 20,
        cwd = opts.cwd or vim.fn.getcwd(),
        esc_esc = opts.esc_esc or false
    }
    -- Implementação fictícia para abertura do terminal flutuante
    vim.cmd("term " .. table.concat(cmd, " "))
    -- Aqui você pode implementar a lógica para abrir o terminal em um buffer flutuante
end

return M


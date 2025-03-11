local M = {}

M.get_commit_hash = function()
  local filename = vim.fn.expand('%')
  local line = vim.fn.line('.')

  local commit_hash = vim.fn.system(string.format('git blame -L %d,%d %s | awk \'{print $1}\'', line, line, filename))
  return commit_hash:gsub('\n', '')
end

M.open_pr_from_commit = function()
  local commit_hash = M.get_commit_hash()
  if commit_hash == "" then
    print("Commit hash não encontrado")
    return
  end

  local pr_list = vim.fn.system(string.format('gh pr list --state all --search %s', commit_hash))

  local pr_id = pr_list:match("(%d+)")
  if not pr_id then
    print("Nenhum PR encontrado para o commit")
    return
  end

  -- Obter a URL do repositório remoto
  local remote_url = vim.fn.system('git remote get-url origin'):gsub('\n', '')

  local orgname, reponame

  -- Verificar se a URL é SSH ou HTTPS
  if remote_url:match("github.com[:/](.-)/(.+)") then
    -- Para SSH (git@github.com:orgname/reponame.git)
    orgname, reponame = remote_url:match("github.com[:/](.-)/(.+).git")
  elseif remote_url:match("https://github.com/(.-)/(.+)") then
    -- Para HTTPS (https://github.com/orgname/reponame.git)
    orgname, reponame = remote_url:match("https://github.com/(.-)/(.+)")
  else
    print("Formato de URL do repositório desconhecido.")
    return
  end

  -- Verifique se o 'orgname' é um nome de organização ou usuário
  -- Aqui estamos assumindo que se o 'orgname' for uma organização, ele terá mais de um caractere.
  -- Caso contrário, será considerado um nome de usuário.
  if orgname:match("^[%a0-9_-]+$") then
    print("Repositório de usuário ou organização:", orgname)
  else
    print("Formato de 'orgname' inesperado.")
    return
  end

  -- Montar a URL do PR
  local pr_url = string.format("https://github.com/%s/%s/pull/%s", orgname, reponame, pr_id)

  -- Abrir a URL no navegador
  vim.fn.system(string.format("xdg-open %s", pr_url))
end

return M


namespace :privilege do

  desc "Migração de privilégios"
  task :deal => :environment do
    
    Privilege.create([
      {system_name: 'Compras', system_code: 'deal', code: 1,  name: "Fornecedores - Permissão Total"},
      {system_name: 'Compras', system_code: 'deal', code: 2,  name: "Fornecedores - Somente Visualizar"},
      {system_name: 'Compras', system_code: 'deal', code: 3,  name: "Pedidos - Permissão Total"},
      {system_name: 'Compras', system_code: 'deal', code: 4,  name: "Pedidos - Somente Visualizar"},
      {system_name: 'Compras', system_code: 'deal', code: 5,  name: "Estoque - Permissão Total"},
      {system_name: 'Compras', system_code: 'deal', code: 6,  name: "Estoque - Somente Entrada"},
      {system_name: 'Compras', system_code: 'deal', code: 7,  name: "Estoque - Somente Saída"},
      {system_name: 'Compras', system_code: 'deal', code: 8,  name: "Estoque - Somente Visualizar"},
      {system_name: 'Compras', system_code: 'deal', code: 9,  name: "Compras - Somente Visualizar"},
      {system_name: 'Compras', system_code: 'deal', code: 10, name: "Compras - Permissão Total"},
      {system_name: 'Compras', system_code: 'deal', code: 11, name: "Pesquisa FPA"},
      {system_name: 'Compras', system_code: 'deal', code: 12, name: "Pesquisa Produto"},
    ])
  end

end
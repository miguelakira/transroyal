class Parceiro < ActiveRecord::Base
  attr_accessible :carros, :celular, :cidade_destino, :cidade_id, :cidade_origem, :observacao, :contato,
  		:estado_destino, :estado_id, :estado_origem, :localizacao, :nome, :telefone, :cnpj, :email, :cpf
  has_one :pagamento
  has_many :cars
  has_many :historicos

  validates	:nome, :presence => { :message => "- O nome nao pode ser deixada em branco!" }

  before_save :titleize_nome

  def titleize_nome
    if self.nome
      self.nome = self.nome.titleize
    end
  end

  def total_freight
    self.cars.map {|car| car.pagamento.valor_total}.inject(0, &:+)
  end

end

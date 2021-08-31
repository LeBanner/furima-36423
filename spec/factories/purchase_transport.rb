FactoryBot.define do
  factory :purchase_transport do
    token {"tok_abcdefghijk00000000000000000"}
    post {"818-0061"}
    prefecture_id {2}
    city   {"筑紫野市"}
    adress   {"3-9-32"}
    building  {"あああ"}
    phone {"08064694869"}
  end
end
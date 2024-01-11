FactoryBot.define do #宣言文でありデータの定義を行う際に記述します。
  factory :list do #どのモデルに対してデータ定義を行うのか記します。factory :モデル名 do ~ end
    title { Faker::Lorem.characters(number:10) } #カラム名｛ 値 ｝の形になっています。※Fakerについては後述
    body { Faker::Lorem.characters(number:30) } #カラム名｛ 値 ｝の形になっています。
  end
end
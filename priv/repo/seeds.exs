# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AvProject.Repo.insert!(%AvProject.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias AvProject.{Repo, Stores.Store, Products.Product, Accounts.User}

current_timestamp = NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)

Repo.insert!(
  %Store{
    id: 100,
    name: "Test Store",
    description: "Borongan City"
  }
)

Repo.insert!(
  %User{
    id: 100,
    email: "test@example.com",
    # password1234
    hashed_password: "$pbkdf2-sha512$160000$xPzQ.4PROffF/.tBHYKcjA$yreO6.jb4i7tkxUvH93/YhTs/Fi.O0ZIIf3YTMm2xY6qz3Ea0dhQyRgxAJlNbWwaI3EKct.sZvg9/Miriw/Ebw",
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  }
)

Repo.insert_all(Product, [
  %{
    sku: "48461873501642",
    category: "Tire",
    brand: "Goodyear",
    name: "Assurance Triplemax 2",
    description: "205/65 R16",
    price: 6583.5,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "53246274672035",
    category: "Tire",
    brand: "Goodyear",
    name: "Assurance Triplemax 2",
    description: "215/55 R17 4PR",
    price: 7590.5,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "61900334751691",
    category: "Tire",
    brand: "Goodyear",
    name: "Assurance Maxguard SUV",
    description: "225/60 R17 4PR",
    price: 11846.5,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "25910577537350",
    category: "Tire",
    brand: "Goodyear",
    name: "Assurance Maxguard SUV",
    description: "225/60 R17 4PR",
    price: 11846.5,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "12714766409859",
    category: "Tire",
    brand: "Goodyear",
    name: "Assurance Maxguard SUV",
    description: "265/65 R17 4PR",
    price: 10982.0,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "22416303430075",
    category: "Tire",
    brand: "Michelin",
    name: "Energy XM2+",
    description: "205/70 R15 4PR",
    price: 7870.0,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "42618760076572",
    category: "Tire",
    brand: "Michelin",
    name: "Primacy 4 ST",
    description: "205/65 R16 4PR",
    price: 7510.0,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "15967239776630",
    category: "Tire",
    brand: "Michelin",
    name: "Agilis 3",
    description: "185 R14 8PR",
    price: 8530.0,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "26368884719696",
    category: "Tire",
    brand: "Dunlop",
    name: "Grandtrek AT5",
    description: "205/70 R15 4PR",
    price: 9810.0,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "13045918424506",
    category: "Tire",
    brand: "Dunlop",
    name: "SP Sport LM705",
    description: "185/65 R14 4PR",
    price: 4755.0,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "30940378713955",
    category: "Tire",
    brand: "CST",
    name: "Crucero CS889",
    description: "185/65 R14 4PR",
    price: 3232.5,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "75953744720994",
    category: "Tire",
    brand: "CST",
    name: "Marquis MR61",
    description: "185/70 R14 4PR",
    price: 3311.0,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "45877134531658",
    category: "Tire",
    brand: "CST",
    name: "Crucero CS889",
    description: "205/55 R16 4PR",
    price: 4905.0,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "98055991318914",
    category: "Tire",
    brand: "CST",
    name: "Sahara CS900",
    description: "265/65 R17 4PR",
    price: 7882.5,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "75549780643779",
    category: "Tire",
    brand: "Bridgestone",
    name: "Ecopia EP300",
    description: "195/65 R15 4PR",
    price: 4927.5,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "63514195050522",
    category: "Tire",
    brand: "Bridgestone",
    name: "Dueler H/T 684",
    description: "265/65 R17 4PR",
    price: 12608.5,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "57324959181915",
    category: "Tire",
    brand: "Presa",
    name: "PSE1",
    description: "185/60 R15 4PR",
    price: 4447.5,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "81087889111587",
    category: "Tire",
    brand: "Presa",
    name: "PS55",
    description: "215/45 R17 4PR",
    price: 6292.5,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "27685191305250",
    category: "Tire",
    brand: "Presa",
    name: "PJ88",
    description: "235/75 R15 4PR",
    price: 8445.0,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
  %{
    sku: "73042544505341",
    category: "Tire",
    brand: "Presa",
    name: "PV99",
    description: "195 R15 8PR",
    price: 5707.0,
    inserted_at: current_timestamp,
    updated_at: current_timestamp,
    store_id: 100
  },
])

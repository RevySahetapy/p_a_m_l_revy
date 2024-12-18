import 'dart:io';
import 'package:vania/vania.dart';
import 'create_users_table.dart';
import 'create_customers.dart';
import 'create_orderitems.dart';
import 'create_orders.dart';
import 'create_personal.dart';
import 'create_productnotes.dart';
import 'package:p_a_m_l_revy/database/migrations/create_products.dart';
import 'package:p_a_m_l_revy/database/migrations/create_todos.dart';
import 'create_vendors.dart';

void main(List<String> args) async {
  await MigrationConnection().setup();
  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
    await CreateCustomers().up();
    await CreateVendors().up();
    await CreateProducts().up();
    await CreateProductnotes().up();
    await CreateOrders().up();
    await CreateOrderitems().up();
    await CreateUserTable().up();
    await CreatePersonal().up();
    await CreateTodos().up();
  }

  dropTables() async {
    await CreateTodos().down();
    await CreatePersonal().down();
    await CreateUserTable().down();
    await CreateOrders().down();
    await CreateOrderitems().down();
    await CreateVendors().down();
    await CreateProductnotes().down();
    await CreateProducts().down();
    await CreateCustomers().down();
  }
}

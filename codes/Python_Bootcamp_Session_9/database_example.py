import sqlite3

connection_string = "./my_database.db"

# raw_query_insert_into_customer = \
#     "INSERT INTO customer (name) VALUES(?);"
# raw_query_insert_into_order_shop = \
#     "INSERT INTO order_shop (name, customer_id) VALUES(?, ?);"

# data_customer = [
#     "Jane", "John", "Mary", "Paul"
# ]

# data_order_shop = [
#     ("Apple", 1),
#     ("Banana", 2),
#     ("Orange", 3),
#     ("Mango", 4),
#     ("Pear", 1),
#     ("Banana", 3)
# ]

# with sqlite3.connect(connection_string) as connection_object:
#     cursor = connection_object.cursor()
#     for customer_name in data_customer:
#         parameter = (customer_name, )
#         cursor.execute(raw_query_insert_into_customer, parameter)

# with sqlite3.connect(connection_string) as connection_object:
#     cursor = connection_object.cursor()
#     for order_shop_product, order_shop_customer_id in data_order_shop:
#         parameter = (order_shop_product, order_shop_customer_id)
#         cursor.execute(raw_query_insert_into_order_shop, parameter)

query_join_customer_with_order_shop = """
SELECT customer.name AS customer_name, order_shop.name AS product FROM
customer INNER JOIN order_shop on customer.id = order_shop.customer_id;
"""

with sqlite3.connect(connection_string) as connection_object:
    cursor = connection_object.cursor()
    cursor.execute(query_join_customer_with_order_shop)
    for result in cursor:
        print(result)

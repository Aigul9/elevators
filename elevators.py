import networkx as nx
import matplotlib.pyplot as plt


G = nx.Graph()

floors = list(range(27, 42))
floors.extend([1, 13])
floors.remove(31)

G.add_nodes_from(floors)

# 27
G.add_edge(27, 16, hall='R')
G.add_edge(27, 18, hall='R')
G.add_edge(27, 19, hall='R')
G.add_edge(27, 20, hall='R')
G.add_edge(27, 21, hall='R')
G.add_edge(27, 22, hall='R')
G.add_edge(27, 23, hall='R')
G.add_edge(27, 24, hall='R')
G.add_edge(27, 25, hall='R')
G.add_edge(27, 32, hall='R')

# 13
G.add_edge(13, 2, hall='L')
G.add_edge(13, 4, hall='L')
G.add_edge(13, 5, hall='L')
G.add_edge(13, 6, hall='L')
G.add_edge(13, 7, hall='L')
G.add_edge(13, 8, hall='L')
G.add_edge(13, 9, hall='L')
G.add_edge(13, 10, hall='L')
G.add_edge(13, 11, hall='L')
G.add_edge(13, 12, hall='L')
G.add_edge(13, 14, hall='L')
G.add_edge(13, 15, hall='L')

# 41
G.add_edge(41, 38, hall='L')
G.add_edge(41, 39, hall='L')
G.add_edge(41, 40, hall='L')

# 40
G.add_edge(40, 28, hall='L')
G.add_edge(40, 32, hall='L')
G.add_edge(40, 38, hall='L')
G.add_edge(40, 39, hall='L')
G.add_edge(40, 41, hall='L')

# 39
G.add_edge(39, 33, hall='C')
G.add_edge(39, 34, hall='C')
G.add_edge(39, 35, hall='C')
G.add_edge(39, 36, hall='C')
G.add_edge(39, 37, hall='C')
G.add_edge(39, 38, hall='C')

G.add_edge(39, 28, hall='L')
G.add_edge(39, 32, hall='L')
G.add_edge(39, 38, hall='L')
G.add_edge(39, 40, hall='L')
G.add_edge(39, 41, hall='L')

# 38
G.add_edge(38, 28, hall='L')
G.add_edge(38, 32, hall='L')
G.add_edge(38, 39, hall='L')
G.add_edge(38, 40, hall='L')
G.add_edge(38, 41, hall='L')

# 37
G.add_edge(37, 33, hall='C')
G.add_edge(37, 34, hall='C')
G.add_edge(37, 35, hall='C')
G.add_edge(37, 36, hall='C')
G.add_edge(37, 38, hall='C')
G.add_edge(37, 39, hall='C')

G.add_edge(37, 28, hall='R')
G.add_edge(37, 32, hall='R')

# 36
G.add_edge(36, 28, hall='L')
G.add_edge(36, 32, hall='L')

G.add_edge(36, 33, hall='C')
G.add_edge(36, 34, hall='C')
G.add_edge(36, 35, hall='C')
G.add_edge(36, 37, hall='C')
G.add_edge(36, 38, hall='C')
G.add_edge(36, 39, hall='C')

# 35
G.add_edge(35, 28, hall='L')
G.add_edge(35, 32, hall='L')

G.add_edge(35, 33, hall='C')
G.add_edge(35, 34, hall='C')
G.add_edge(35, 36, hall='C')
G.add_edge(35, 37, hall='C')
G.add_edge(35, 38, hall='C')
G.add_edge(35, 39, hall='C')

# 34
G.add_edge(34, 26, hall='L')
G.add_edge(34, 28, hall='L')
G.add_edge(34, 29, hall='L')
G.add_edge(34, 30, hall='L')
G.add_edge(34, 32, hall='L')

G.add_edge(34, 33, hall='C')
G.add_edge(34, 35, hall='C')
G.add_edge(34, 36, hall='C')
G.add_edge(34, 37, hall='C')
G.add_edge(34, 38, hall='C')
G.add_edge(34, 39, hall='C')

# 33
G.add_edge(33, 34, hall='C')
G.add_edge(33, 35, hall='C')
G.add_edge(33, 36, hall='C')
G.add_edge(33, 37, hall='C')
G.add_edge(33, 38, hall='C')
G.add_edge(33, 39, hall='C')

G.add_edge(33, 26, hall='L')
G.add_edge(33, 28, hall='L')
G.add_edge(33, 29, hall='L')
G.add_edge(33, 30, hall='L')
G.add_edge(33, 32, hall='L')

# 32
G.add_edge(32, 1, hall='R')
G.add_edge(32, 16, hall='R')
G.add_edge(32, 18, hall='R')
G.add_edge(32, 19, hall='R')
G.add_edge(32, 20, hall='R')
G.add_edge(32, 21, hall='R')
G.add_edge(32, 22, hall='R')
G.add_edge(32, 23, hall='R')
G.add_edge(32, 24, hall='R')
G.add_edge(32, 25, hall='R')
G.add_edge(32, 27, hall='R')

G.add_edge(32, 26, hall='L')
G.add_edge(32, 28, hall='L')
G.add_edge(32, 29, hall='L')
G.add_edge(32, 30, hall='L')
G.add_edge(32, 33, hall='L')
G.add_edge(32, 34, hall='L')
G.add_edge(32, 35, hall='L')
G.add_edge(32, 36, hall='L')
G.add_edge(32, 37, hall='L')
G.add_edge(32, 38, hall='L')
G.add_edge(32, 39, hall='L')
G.add_edge(32, 40, hall='L')

# 30
G.add_edge(30, 26, hall='L')
G.add_edge(30, 28, hall='L')
G.add_edge(30, 29, hall='L')
G.add_edge(30, 32, hall='L')
G.add_edge(30, 33, hall='L')
G.add_edge(30, 34, hall='L')

# 29
G.add_edge(29, 26, hall='L')
G.add_edge(29, 28, hall='L')
G.add_edge(29, 30, hall='L')
G.add_edge(29, 32, hall='L')
G.add_edge(29, 33, hall='L')
G.add_edge(29, 34, hall='L')

# 28
G.add_edge(28, 2, hall='C')

G.add_edge(28, 26, hall='L')
G.add_edge(28, 29, hall='L')
G.add_edge(28, 30, hall='L')
G.add_edge(28, 32, hall='L')
G.add_edge(28, 33, hall='L')
G.add_edge(28, 34, hall='L')
G.add_edge(28, 35, hall='L')
G.add_edge(28, 36, hall='L')
G.add_edge(28, 37, hall='L')
G.add_edge(28, 38, hall='L')
G.add_edge(28, 39, hall='L')
G.add_edge(28, 40, hall='L')

# 26
G.add_edge(26, 1, hall='C')

G.add_edge(26, 28, hall='L')
G.add_edge(26, 29, hall='L')
G.add_edge(26, 30, hall='L')
G.add_edge(26, 32, hall='L')
G.add_edge(26, 33, hall='L')
G.add_edge(26, 34, hall='L')

# pos = nx.spring_layout(G)
# nx.draw(G, pos, with_labels=True, node_size=1500, node_color='skyblue', font_size=10)
#
# edge_labels = nx.get_edge_attributes(G, 'hall')
# nx.draw_networkx_edge_labels(G, pos, edge_labels=edge_labels)
#
# plt.show()

start_floor = 2
dest_floor = 32

shortest_path = nx.shortest_path(G, source=start_floor, target=dest_floor)

print("Shortest path from {} to {}:".format(start_floor, dest_floor))
print(shortest_path)

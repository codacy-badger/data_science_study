# with is the context manager
with open("testfiles/world_ind_pop_data.csv") as world_pop_df:
    world_pop_df.readline()  # to skip header line!!!

    item_count = {}
    for j in range(5):
        line = world_pop_df.readline().split(",")
        print(line[0], line[3])

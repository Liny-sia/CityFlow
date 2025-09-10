import cityflow

eng = cityflow.Engine("config/config.json")

for i in range(100):
    eng.next_step()
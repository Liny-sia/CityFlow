import cityflow
import csv

env = cityflow.Engine("config/config.json", thread_num=1)

travel_times=[]
vehicle_counts=[]

with open("metrics.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["step", "avg_travel_time", "vehicle_count"])

    for step in range(1000):
        env.next_step()
        avg_time = env.get_average_travel_time()
        count = len(env.get_vehicles())

        # Save metrics
        writer.writerow([step, avg_time, count])
        print(f"Step {step}: avg_time={avg_time:.2f}, vehicles={count}")
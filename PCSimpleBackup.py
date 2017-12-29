# PC Simple Backup
import tkinter as tk
from tkinter import ttk

print("Hello World")
root = tk.Tk()

root.minsize(width=600, height=300)
root.maxsize(width=600, height=300)

w = tk.Frame(pady=10, padx=10)
w.winfo_toplevel().title("PC Simple Backup by Mikel Matticoli")
w.pack()

l1 = tk.Label(w, text="Source").grid(row=0)
space = tk.Label(w, text="").grid(row=1)
l2 = tk.Label(w, text="Destination").grid(row=2)

src = tk.Entry(w).grid(row=0, column=1, columnspan=4)
srcSpace = tk.Label(w, text="").grid(row=0, column=5)
srcAdd = tk.Button(w, text="+").grid(row=0, column=6)
dest = tk.Entry(w).grid(row=2, column=1, columnspan=4)


root.mainloop()

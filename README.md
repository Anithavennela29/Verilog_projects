# Verilog Learning Repository

## 📌 Overview

This repository documents my learning journey in **Verilog Hardware Description Language (HDL)**, starting from basic digital design concepts to implementing simple RTL modules.

The aim is to build a strong foundation in **digital design and RTL coding**.

---

## 🧠 Topics Covered

* Introduction to Verilog
* Data types (`wire`, `reg`)
* Operators
* Combinational logic
* Sequential logic
* Always blocks
* Blocking (`=`) vs Non-blocking (`<=`) assignments

---

## 📁 Project Structure

```
verilog-learning/
 ├── dff/        # D Flip-Flop
 ├── mux/        # Multiplexer
 ├── counter/    # Counter
```

Each project contains:

* `rtl/` → Verilog design files
* `tb/` → Testbench files

---

## 🚀 Example: D Flip-Flop

### Description

Implementation of a basic **D Flip-Flop using Verilog**.

### Features

* Positive edge triggered
* Reset functionality

### Simulation

Example command:

```
xrun rtl/dff.v tb/dff_tb.v
```

---

## 🛠️ Tools Used

* Cadence Xcelium (for simulation)


---

## 📊 Learning Approach

This repository follows a **step-by-step approach**:

```
Basic Gates → D Flip-Flop → Counter → FIFO (next)
```

---

## 🎯 Goals

* Understand Verilog fundamentals
* Write clean RTL code
* Build basic digital design blocks
* Prepare for advanced topics like SystemVerilog and verification

---

## 📌 Future Work

* FIFO design
* FSM design
* Transition to SystemVerilog

---

## 📬 Note

This repository is part of my continuous learning process. Updates will be added regularly as I progress.

---

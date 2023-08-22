CREATE TABLE patients (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	date_of_birth DATE
);
	
CREATE TABLE medical_history (
	id SERIAL PRIMARY KEY,
	admitted_at TIMESTAMP,
	patient_id INT,
	status VARCHAR(50),
	CONSTRAINT fk_patient_id FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE INDEX patient_id_index ON medical_history(patient_id);
	
CREATE TABLE invoices (
	id SERIAL PRIMARY KEY,
	total_amount DECIMAL,
	generated_at TIMESTAMP,
	payed_at TIMESTAMP,
	medical_history_id INT,
	CONSTRAINT fk_medical_history_id FOREIGN KEY (medical_history_id) REFERENCES medical_history(id)
);

CREATE INDEX invoices_medical_history_id_index ON invoices(medical_history_id);

CREATE TABLE treatments (
	id SERIAL PRIMARY KEY,
	type VARCHAR(50),
	name VARCHAR(50)
);

CREATE TABLE medicalHistory_treatment_link (
	id SERIAL PRIMARY KEY,
	medical_history_id INT,
	treatment_id INT,
	CONSTRAINT fk_medical_history_id FOREIGN KEY(medical_history_id) REFERENCES medical_history(id),
	CONSTRAINT fk_treatment_id FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);

CREATE INDEX link_medical_history_id_index ON medicalHistory_treatment_link(medical_history_id);
CREATE INDEX link_treatment_id_index ON medicalHistory_treatment_link(treatment_id);

CREATE TABLE invoice_items (
	id SERIAL PRIMARY KEY,
	unit_price DECIMAL,
	quantity INT,
	total_price DECIMAL,
	invoice_id INT,
	treatment_id INT,
	CONSTRAINT fk_invoice_id FOREIGN KEY(invoice_id) REFERENCES invoices(id),
	CONSTRAINT fk_treatment_id FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);

CREATE INDEX in_items_invoice_id_index ON invoice_items(invoice_id);
CREATE INDEX in_items_treatment_id_index ON invoice_items(treatment_id);

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
	


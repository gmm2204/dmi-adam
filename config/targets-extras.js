module.exports = {
    covid19Cases(c, r) {
        return (r.form === 'case_clinical_information' && r.fields.prerequisites.outbreak_code === 'covid19');
    },
    covid19ConfirmedCases(c, r) {
        return (r.form === 'case_outcome' && r.fields.prerequisites.outbreak_code === 'covid19' && r.fields.co_final.cof_case_classification === 'confirmed');
    }
};
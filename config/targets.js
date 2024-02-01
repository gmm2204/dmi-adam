// const { covid19ConfirmedCases } = require('./targets-extras');

module.exports = [
    {
        id: 'cholera_all_cases',
        type: 'count',
        icon: 'icon-patients-colored',
        goal: -1,
        translation_key: 'targets.outbreak.cholera.title',
        subtitle_translation_key: 'targets.outbreak.cholera.all.subtitle',
        appliesTo: 'reports',
        appliesIf: (c, r) => {
            return (r.form === 'case_clinical_information' && r.fields.prerequisites.outbreak_disease === 'cholera');
        },
        date: 'reported',
    },
    {
        id: 'cholera_confirmed_cases',
        type: 'count',
        icon: 'icon-cholera-colored',
        goal: -1,
        translation_key: 'targets.outbreak.cholera.title',
        subtitle_translation_key: 'targets.outbreak.cholera.confirmed.subtitle',
        appliesTo: 'reports',
        appliesIf: (c, r) => {
            return (r.form === 'case_outcome' && r.fields.prerequisites.outbreak_disease === 'cholera' && r.fields.co_final.cof_case_classification === 'confirmed');
        },
        date: 'reported',
    },
    {
        id: 'cholera_recovered_cases',
        type: 'count',
        icon: 'icon-recovered-colored',
        goal: -1,
        translation_key: 'targets.outbreak.cholera.title',
        subtitle_translation_key: 'targets.outbreak.cholera.recovered.subtitle',
        appliesTo: 'reports',
        appliesIf: (c, r) => {
            return (r.form === 'case_outcome' && r.fields.prerequisites.outbreak_disease === 'cholera' && r.fields.co_final.cof_patient_status === 'recovered');
        },
        date: 'reported',
    },
    {
        id: 'rvf_cases',
        type: 'count',
        icon: 'icon-patients-colored',
        goal: -1,
        translation_key: 'targets.outbreak.rvf.title',
        subtitle_translation_key: 'targets.outbreak.rvf.all.subtitle',
        appliesTo: 'reports',
        appliesIf: (c, r) => {
            return (r.form === 'case_clinical_information' && r.fields.prerequisites.outbreak_disease === 'rift_valley_fever');
        },
        date: 'reported',
    },
    {
        id: 'rvf_confirmed_cases',
        type: 'count',
        icon: 'icon-covid19-colored',
        goal: -1,
        translation_key: 'targets.outbreak.rvf.title',
        subtitle_translation_key: 'targets.outbreak.rvf.confirmed.subtitle',
        appliesTo: 'reports',
        appliesIf: (c, r) => {
            return (r.form === 'case_outcome' && r.fields.prerequisites.outbreak_disease === 'rift_valley_fever' && r.fields.co_final.cof_case_classification === 'confirmed');
        },
        date: 'reported',
    },
    {
        id: 'rvf_recovered_cases',
        type: 'count',
        icon: 'icon-recovered-colored',
        goal: -1,
        translation_key: 'targets.outbreak.rvf.title',
        subtitle_translation_key: 'targets.outbreak.rvf.recovered.subtitle',
        appliesTo: 'reports',
        appliesIf: (c, r) => {
            return (r.form === 'case_outcome' && r.fields.prerequisites.outbreak_disease === 'rift_valley_fever' && r.fields.co_final.cof_patient_status === 'recovered');
        },
        date: 'reported',
    },
    {
        id: 'covid19_cases',
        type: 'count',
        icon: 'icon-patients-colored',
        goal: -1,
        translation_key: 'targets.outbreak.covid19.title',
        subtitle_translation_key: 'targets.outbreak.covid19.all.subtitle',
        appliesTo: 'reports',
        appliesIf: (c, r) => {
            return (r.form === 'case_clinical_information' && r.fields.prerequisites.outbreak_code === 'covid19');
        },
        date: 'reported',
    },
    {
        id: 'covid19_confirmed_cases',
        type: 'count',
        icon: 'icon-covid19-colored',
        goal: -1,
        translation_key: 'targets.outbreak.covid19.title',
        subtitle_translation_key: 'targets.outbreak.covid19.confirmed.subtitle',
        appliesTo: 'reports',
        appliesIf: (c, r) => {
            return (r.form === 'case_outcome' && r.fields.prerequisites.outbreak_code === 'covid19' && r.fields.co_final.cof_case_classification === 'confirmed');
        },
        date: 'reported',
    },
    {
        id: 'recovered_cases',
        type: 'count',
        icon: 'icon-recovered-colored',
        goal: -1,
        translation_key: 'targets.outbreak.covid19.title',
        subtitle_translation_key: 'targets.outbreak.covid19.recovered.subtitle',
        appliesTo: 'reports',
        appliesIf: (c, r) => {
            return (r.form === 'case_outcome' && r.fields.prerequisites.outbreak_code === 'covid19' && r.fields.co_final.cof_patient_status === 'recovered');
        },
        date: 'reported',
    }
];
// const { covid19ConfirmedCases } = require('./targets-extras');

module.exports = [
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
        id: 'dysentery_all_cases',
        type: 'count',
        icon: 'icon-patients-colored',
        goal: -1,
        translation_key: 'targets.outbreak.dysentery.title',
        subtitle_translation_key: 'targets.outbreak.dysentery.all.subtitle',
        appliesTo: 'reports',
        appliesIf: (c, r) => {
            return (r.form === 'case_clinical_information' && r.fields.prerequisites.outbreak_code === 'dysentery');
        },
        date: 'reported',
    },
    {
        id: 'dysentery_confirmed_cases',
        type: 'count',
        icon: 'icon-diarrhea-colored',
        goal: -1,
        translation_key: 'targets.outbreak.dysentery.title',
        subtitle_translation_key: 'targets.outbreak.dysentery.confirmed.subtitle',
        appliesTo: 'reports',
        appliesIf: (c, r) => {
            return (r.form === 'case_outcome' && r.fields.prerequisites.outbreak_code === 'dysentery' && r.fields.co_final.cof_case_classification === 'confirmed');
        },
        date: 'reported',
    },
    {
        id: 'cholera_all_cases',
        type: 'count',
        icon: 'icon-patients-colored',
        goal: -1,
        translation_key: 'targets.outbreak.cholera.title',
        subtitle_translation_key: 'targets.outbreak.cholera.all.subtitle',
        appliesTo: 'reports',
        appliesIf: (c, r) => {
            return (r.form === 'case_clinical_information' && r.fields.prerequisites.outbreak_code === 'cholera');
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
            return (r.form === 'case_outcome' && r.fields.prerequisites.outbreak_code === 'cholera' && r.fields.co_final.cof_case_classification === 'confirmed');
        },
        date: 'reported',
    }
];
const { icCICholeraPositive, icCICholeraAll, icCICovid19, icCICovid19All } = require('./targets-extras');

module.exports = [
    // Positive cases (cholera) (this month)
    {
        id: 'ci_cholera_positive_month',
        type: 'count',
        icon: 'icon-cholera-colored',
        goal: -1,
        translation_key: 'targets.ci_cholera.title',
        subtitle_translation_key: 'targets.ci_cholera.subtitle_positive_month',
        appliesTo: 'reports',
        appliesIf: icCICholeraPositive,
        date: 'reported' //This month
    },

    // Positive cases (cholera) (all time)
    {
        id: 'ci_cholera_positive_all',
        type: 'count',
        icon: 'icon-cholera-colored',
        goal: -1,
        translation_key: 'targets.ci_cholera.title',
        subtitle_translation_key: 'targets.ci_cholera.subtitle_positive_all',
        appliesTo: 'reports',
        appliesIf: icCICholeraPositive,
        date: 'now' //All time
    },

    // All cases (cholera) (all time)
    {
        id: 'ci_cholera_all',
        type: 'count',
        icon: 'icon-cholera-colored',
        goal: -1,
        translation_key: 'targets.ci_cholera.title',
        subtitle_translation_key: 'targets.ci_cholera.subtitle_all',
        appliesTo: 'reports',
        appliesIf: icCICholeraAll,
        date: 'now' //All time
    },

    // Positive cases (covid-19) (this month)
    {
        id: 'ci_covid19_positive_month',
        type: 'count',
        icon: 'icon-covid19-colored',
        goal: -1,
        translation_key: 'targets.ci_covid19.title',
        subtitle_translation_key: 'targets.ci_covid19.subtitle_positive_month',
        appliesTo: 'reports',
        appliesIf: icCICovid19,
        date: 'reported',
        aggregate: true
    },

    // Positive cases (covid-19) (all time)
    {
        id: 'ci_covid19_positive_all',
        type: 'count',
        icon: 'icon-covid19-colored',
        goal: -1,
        translation_key: 'targets.ci_covid19.title',
        subtitle_translation_key: 'targets.ci_covid19.subtitle_positive_all',
        appliesTo: 'reports',
        appliesIf: icCICovid19,
        date: 'now',
        aggregate: true
    },

    // All cases (covid-19) (all time)
    {
        id: 'ci_covid19_all',
        type: 'count',
        icon: 'icon-covid19-colored',
        goal: -1,
        translation_key: 'targets.ci_covid19.title',
        subtitle_translation_key: 'targets.ci_covid19.subtitle_all',
        appliesTo: 'reports',
        appliesIf: icCICovid19All,
        date: 'now',
        aggregate: true
    }
];
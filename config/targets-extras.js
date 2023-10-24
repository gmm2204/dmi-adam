module.exports = {
    icCICholeraPositive(c, r) {
        return r.form === 'D' ||
            (r.form === 'case_investigation' &&
                (
                    r.fields.outbreak_screening.os_criteria_met === 'yes' &&
                    r.fields.ci_outbreak.ci_outbreak_name === 'cholera'
                )
            );
    },
    icCICholeraAll(c, r) {
        return r.form === 'D' ||
            (r.form === 'case_investigation' &&
                (
                    r.fields.ci_outbreak.ci_outbreak_name === 'cholera'
                )
            );
    },
    icCICovid19(c, r) {
        return r.form === 'E' ||
            (r.form === 'case_investigation' &&
                (
                    r.fields.outbreak_screening.os_criteria_met === 'yes' &&
                    r.fields.ci_outbreak.ci_outbreak_name === 'covid19'
                )
            );
    },
    icCICovid19All(c, r) {
        return r.form === 'E' ||
            (r.form === 'case_investigation' &&
                (
                    r.fields.ci_outbreak.ci_outbreak_name === 'covid19'
                )
            );
    },
    countReportsSubmittedInWindow(reports, form, start, end) {
        var reportsFound = 0;
        reports.forEach(function (r) {
            if (form.indexOf(r.form) >= 0) {
                if (r.reported_date >= start && r.reported_date <= end) {
                    reportsFound++;
                }
            }
        });
        return reportsFound;
    },
    countReports(reports) {
        var reportsFound = 0;
        reports.forEach(function () {
            reportsFound++;
        });
        return reportsFound;
    }
};
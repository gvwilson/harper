-- Example Harper-Lite database for explanatory and testing purposes.
-- Use `schema.sql` to create tables first.

insert into lesson values
	(NULL, "2019-01-01 09:00:00");

insert into lesson_version values
	(NULL,
         1,
         "2019-01-01 09:00:01",
         "Tests of Univariate Normality",
         "How can we tell if univariate data is normally distributed?\nThis lesson describes three tests and explains the strengths and weaknesses of each.",
         "1.3.1",
	 "http://stats.fringe.tv/stats454/normality/stats454-normality.zip",
	 "https://creativecommons.org/licenses/by-nc/4.0/",
	 "This material was originally developed as part of a sequence on data integrity\nfor seniors and graduate students in statistics, then modified for delivery in\nconference workshops.  The Shapiro-Wilk material feels pretty solid; the ECF\nmaterial has only been used a couple of times, and probably needs more work.");

insert into person values
	(NULL, "2019-01-01 09:00:01");

insert into person_version values
	(NULL,
         1,
         "2019-01-01 09:00:02",
         "Walter Bishop",
         "Bishop, Walter",
         "w.bishop@fringe.tv");

insert into contributor values
	(NULL, 1, 1);

insert into objective values
	(NULL, 1, "Describe the 68-95-99.7 rule and explain why it works and when it fails."),
	(NULL, 1, "Describe and apply the Shapiro-Wilk test for normality of univariate data."),
	(NULL, 1, "Describe and apply the ECF test for normality of multivariate data.");

insert into keyword values
	(NULL, "2019-01-01 09:00:03", "Normal distribution"),
	(NULL, "2019-01-01 09:00:03", "Quantiles"),
	(NULL, "2019-01-01 09:00:03", "Statistical power"),
	(NULL, "2019-01-01 09:00:03", "Covariance matrix"),
	(NULL, "2019-01-01 09:00:03", "Empirical characteristic function"),
	(NULL, "2019-01-01 09:00:03", "Install R package"),
	(NULL, "2019-01-01 09:00:03", "`quantile`"),
	(NULL, "2019-01-01 09:00:03", "Kurtosis risk"),
	(NULL, "2019-01-01 09:00:03", "68/95/99.7 Rule"),
	(NULL, "2019-01-01 09:00:03", "Shapiro-Wilk test"),
	(NULL, "2019-01-01 09:00:03", "ECF test")
;

insert into requisites values
	(NULL, 1, "pre", 1),
        (NULL, 1, "pre", 2),
        (NULL, 1, "pre", 3),
        (NULL, 1, "pre", 4),
        (NULL, 1, "pre", 5),
        (NULL, 1, "pre", 6),
	(NULL, 1, "post", 7),
        (NULL, 1, "post", 8),
        (NULL, 1, "post", 9),
        (NULL, 1, "post", 10),
        (NULL, 1, "post", 11);

insert into installation values
	(NULL, 1, "nickr", ">=1.2.3")
;

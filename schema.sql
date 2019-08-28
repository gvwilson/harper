-- Harper-Lite Database Schema
--
-- * Every record has a unique auto-incremented `id` serial number column.
--
-- * All foreign keys are named `TABLE_id` where `TABLE` is the name of the
--   table they reference.
--
-- * The `created` timestamp fields record "YYYY-MM-DD HH:MM:SS" UTC timestamps.
--
-- * All text fields marked `not null` are expected to be non-empty as well.
--
-- * Lessons and people can be updated, and so are represented using a two-part
--   structure: `THING` as a common reference, and `THING_version` with
--   user-visible details.
--
-- * "Keywords" are actually phrases used to identify prerequisites (what the
--   learner needs to know to start the lesson) and postrequisites (what the
--   lesson hopes they'll understand afterward).  These are not versioned
--   because they are not supplanted, just added to.
--
-- * If a lesson's keywords (prereqs or postreqs) are changed in order to use
--   more canonical terminology, create a new version of the lesson and tie the
--   new (canonical) keywords to that version.

-- Unique identifier for a lesson.
create table lesson (
	-- unique ID for each lesson
	id			integer	not null primary key autoincrement,
        -- date lesson was first created
	created			text	not null
);

-- Details of a specific version of a lesson.
create table lesson_version (
	-- globally unique ID for each version of each lesson
	id			integer	not null primary key autoincrement,
        -- ID of the lesson that this is a version of
	lesson_id		integer	not null,
        -- date this version was created
	created			integer	not null,
        -- title of this version of the lesson
	title			text	not null,
        -- abstract for this version of the lesson
	abstract		text	not null,
        -- lesson's own version ID
	version			text	not null,
        -- URL of downloadable version of lesson material (if any)
	download		text,
        -- license for this version of the lesson
	license			text	not null,
        -- notes for this version of the lesson
	notes			text	not null,
        -- cross-reference to the lesson that this is a version of
	foreign key(lesson_id)
	        references lesson(id)
);

-- Unique identifier for a person.
create table person (
	-- unique ID for each person
	id			integer	not null primary key autoincrement,
        -- date person was first created
	created			text	not null
);

-- Details of a specific version of a person.
create table person_version (
	-- globally unique ID for each version of each person
	id			integer	not null primary key autoincrement,
        -- ID of the person that this is a version of
	person_id		integer	not null,
        -- date this version was created
	created			integer	not null,
        -- person's name (as presented)
	name			text	not null,
        -- person's name (for sorting purposes)
	sort_name		text	not null,
        -- person's contact email
	email			text,
        -- cross-reference to the person that this is a version of
	foreign key(person_id)
	        references person(id)
);

-- Join table connecting people to lessons.
create table contributor (
	-- unique ID for this join record
	id			integer	not null primary key autoincrement,
        -- lesson version referred to
	lesson_version_id	integer	not null,
        -- person version referred to
	person_version_id	integer	not null,
        -- cross-references
	foreign key(lesson_version_id)
	        references lesson_version(id),
	foreign key(person_version_id)
	        references person_version(id)
);

-- Learning objectives for each version of a lesson.
create table objective (
	-- globally unique ID for this learning objective
	id			integer	not null primary key autoincrement,
        -- lesson version referred to
	lesson_version_id	integer	not null,
        -- learning objective
	objective		text	not null,
        -- cross-references
	foreign key(lesson_version_id)
	        references lesson_version(id)
);

-- Keywords (actually phrases) used for prereqs and postreqs.
create table keyword (
	-- unique ID for this keyword
	id			integer	not null primary key autoincrement,
        -- date this keyword was created
	created			text	not null,
        -- text of keyword
	keyword			text	not null
);

-- Join table connecting keywords as pre/post-requisites of a lesson version.
create table requisites (
	-- unique ID for this join record
	id			integer	not null primary key autoincrement,
        -- lesson version referred to
	lesson_version_id	integer	not null,
        -- pre- or post-requisite? ("pre", "post")
        pre_post		text	not null,
        -- keyword referred to
	keyword_id		integer	not null,
        -- cross-references
	foreign key(lesson_version_id)
	        references lesson_version(id),
	foreign key(keyword_id)
	        references keywords(id)
);

-- Software requirements for each lesson version.
create table installation (
	-- unique ID for this software requirement
	id			integer	not null primary key autoincrement,
        -- ID of lesson version
        lesson_version_id	integer	not null,
        -- thing required (e.g., R, lubridate)
	requirement		text	not null,
        -- details (e.g., package version)
        details			text,
        -- cross-references
	foreign key(lesson_version_id)
	        references lesson_version(id)
);

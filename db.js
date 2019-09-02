/*
 * Database interface.
 */

const sqlite3 = require('sqlite3')

class DB {
  constructor (dbPath) {
    this.dbPath = dbPath
    this.db = new sqlite3.Database(path, sqlite3.OPEN_READWRITE, (err) => {
      if (err) throw new Error(`Database open error ${err} for "${path}": ${err}`)
    })
  }

  createLesson (spec) {
  }

  updateLesson (spec) {
  }

  createPerson (spec) {
  }

  updatePerson (spec) {
  }
}

//
//  Delete.swift
//  PostgresStORM
//
//  Created by Jonathan Guthrie on 2016-09-24.
//
//

import PerfectLib
import StORM
import PostgreSQL

// TODO:  detect response and return t/f as appropriate

extension PostgresStORM {

	func deleteSQL(_ table: String, idName: String = "id") -> String {
		return "DELETE FROM \(table) WHERE \(idName) = $1"
	}

	/// Deletes one row, with an id as an integer
	@discardableResult
	public func delete(id: Int, idName: String = "id") throws -> Bool {
		do {
			try exec(deleteSQL(self.table(), idName: idName), params: [String(id)])
		} catch {
			throw StORMError.error(error.localizedDescription)
		}
		return true
	}

	/// Deletes one row, with an id as a String
	@discardableResult
	public func delete(id: String, idName: String = "id") throws -> Bool {
		do {
			try exec(deleteSQL(self.table(), idName: idName), params: [id])
		} catch {
			throw StORMError.error(error.localizedDescription)
		}
		return true
	}

	/// Deletes one row, with an id as a UUID
	@discardableResult
	public func delete(id: UUID, idName: String = "id") throws -> Bool {
		do {
			try exec(deleteSQL(self.table(), idName: idName), params: [id.string])
		} catch {
			throw StORMError.error(error.localizedDescription)
		}
		return true
	}

}

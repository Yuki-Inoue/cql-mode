;;; cql-mode.el --- Major mode for editting CQLs

;; Copyright (C) 2016 Yuki Inoue

;; Author: Yuki Inoue <inouetakahiroki at gmail.com>
;; Version: 0.0.1
;; Keywords: cql, cassandra
;; URL: https://github.com/Yuki-Inoue/cql-mode

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(require 'sql)

(defvar cql-mode-font-lock-keywords
  (list
   (sql-font-lock-keywords-builder
    'font-lock-keyword-face nil
    "insert" "into" "values" "table" "create")
   sql-mode-font-lock-object-name
   ;; cql data types
   (sql-font-lock-keywords-builder
    'font-lock-type-face nil
    "ascii" "bigint" "blob" "boolean" "counter" "decimal" "double"
    "float" "inet" "int" "list" "map" "set" "text" "timestamp"
    "uuid" "timeuuid" "varchar" "varint")))

;;;###autoload
(define-derived-mode cql-mode prog-mode "CQL"
  "cql major mode"

  (set-syntax-table (copy-syntax-table sql-mode-syntax-table))

  (kill-local-variable 'font-lock-set-defaults)
  (setq font-lock-defaults
        (list '(cql-mode-font-lock-keywords) nil t
              (sql-product-font-lock-syntax-alist)))

  )

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.cql\\'" . cql-mode))

(provide 'cql-mode)

;;; cql-mode.el ends here

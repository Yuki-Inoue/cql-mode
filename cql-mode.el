
(require 'sql)

(setq cql-mode-font-lock-keywords
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

(define-derived-mode cql-mode prog-mode "CQL"
  "cql major mode"

  (set-syntax-table (copy-syntax-table sql-mode-syntax-table))

  (kill-local-variable 'font-lock-set-defaults)
  (setq-localfont-lock-defaults
              (list '(cql-mode-font-lock-keywords) nil t
                    (sql-product-font-lock-syntax-alist)))

   ; (when (and (fboundp 'font-lock-mode)
   ;            (boundp 'font-lock-mode)
   ;            font-lock-mode)
   ;   (font-lock-mode-internal nil)
   ;   (font-lock-mode-internal t))

   ; (add-hook 'font-lock-mode-hook
   ;           #'(lambda ()
   ;               ;; Provide defaults for new font-lock faces.
   ;               (defvar font-lock-builtin-face
   ;                 (if (boundp 'font-lock-preprocessor-face)
   ;                     font-lock-preprocessor-face
   ;                   font-lock-keyword-face))
   ;               (defvar font-lock-doc-face font-lock-string-face))
   ;           nil t)

  )

; (add-to-list 'auto-mode-alist '("\\.cql\\'" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.cql\\'" . cql-mode))

; (sql-add-product 'cassandra "Cassandra"
;                  '(:free-software t))
;
;
;
;
; (sql-set-product-feature 'cassandra
;                          :font-lock
;                          cql-mode-font-lock-keywords)
;
; (defcustom cassandra-program "cassandra"
;   "Cassandra Program"
;   :type 'file
;   :group 'SQL)
;
;
; (sql-set-product-feature 'cassandra
;                          :sqli-program 'cassandra-program)

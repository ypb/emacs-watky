
;;; These are our WIP experiments not fit for main breadcrumb.el file

;; FOR FUCKS SAKE +-2**29 INTS? WHERE'R'LISPbigIntz?
(defun tm-current-time-stamp-num ()
  ;; use float... meh...
  (let ((now (current-time)))
    (list now
    (+ (* (car now)
          (expt 2.0 16))
       (cadr now)
       (- (car (current-time-zone)))))))
;; this one looks like real utc...
;; (set-time-zone-rule nil) (current-time-zone)
(defun tm-timestamp-list ()
  (append (tm-current-time-stamp-num)
          (tm-current-time-stamp-str)))
(defun tm-current-time-stamp-str ()
  (let ((now (current-time))
        (frm "%s"))
    ;; GMT...
    (format-time-string frm now t)))
;; this...
(defun tm-utc-time-stamp-str ()
  ;; use float... meh...
  (let ((now (current-time))
        (off-utc (car (current-time-zone))))
    (format "%d"
            (+ (* (car now)
                  (expt 2.0 16))
               (cadr now)
               (- off-utc)))))
;; this...
(defun tm-compare-times (off)
  (list (format-time-string "%s" (current-time))
        (format-time-string "%s" (tm-current-time-utc))
        (format-time-string "%s" (tm-current-time-utc off))
        (tm-utc-time-stamp-str)))

;; Local Variables:
;; mode: Emacs-Lisp
;; indent-tabs-mode: nil
;; End:

;;; doings.el ends here

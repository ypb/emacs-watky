;;; threadmachiny.el --- Aka watky, discovering entish nature of breadcrumbs.
;; 
;; Copyright (C) 2011 Michal Kowalski
;;
;; Author: ypb <superflouos(TA)gmail(TOD)com>
;; Created: October, 2011
;; Version: 0.0.1
;; Keywords: thread, state, machine, branch, handy, bookmark, breadcrumb

;; This file is not part of anything especially not any old fartsy Emacsen.

;;; License
;;
;; TODO: GPL3 blurb...
;;

;;; Overview:

;;; Commentary:
;;
;; eh... looks like we'll just have to rewrite it from scratch
;; it just won't mix... cognitivaly speaking and I want to use
;; breadcrumbs as they are (modulo minor fixes and improvements),
;; while doing da watky.

;;; Installation:

;;; Configuration:

;;; History:

;;; Todo:


;;; Code:

;; Public section? (it's all Public in the Escape Meta Alt Control Shift land)

;; we needs it
(require 'bookmark)
;; bookmark-make-record, bookmark-prop-get, bookmark-prop-set,
;; bookmark-name-from-full-record (lulz)

;;; User Configuration Variables



;;; User callable functions

(defun tm-set ()
  "Set a bookmark at the current buffer and current position.
Let's try to use emacsen bookmarks system already in place. Might learn
something along the way and save ourselves reinventing wheel squarely."
  (interactive)
  (let ((bookmark (tm-make-record)))
    (tm-bookmark-store bookmark)
    (tm-list)))

(defun tm-clear ()
  "Nullify `*tm-bookmarks*'."
  (interactive)
  (setq *tm-bookmarks* ()))

(defun tm-list (&optional full)
  "For now ugly hack of a `*tm-bookmarks' pp."
  (interactive)
  (if full
      (mapcar 'pp *tm-bookmarks*)
    (message "%s" (mapcar 'tm-bookmark-terse *tm-bookmarks*))))

;; Private section

(defvar *tm-bookmarks* ()
  "AList of traditional emacsen bookmarks.
Though except for getting initial bookmark, preserving compatible to them
format and perhaps reusing jumping mechanism not much else will be of re-use
to us.")

;; Bookmark record functions

(defun tm-bookmark-store (bookmark)
  (push bookmark *tm-bookmarks*))

(defun tm-make-record ()
  "Get a bookmark using bookmark.el machinery as much as possible."
  (let* ((bookmark (bookmark-make-record))
         (timestamp (tm-current-time-utc))
         (el-name (if (null (car bookmark)) "()"
                    (car bookmark))))
    (bookmark-prop-set bookmark 'bookmark-el-name el-name)
    (setcar bookmark (format-time-string "%s" timestamp))
    (bookmark-prop-set bookmark
                       'tm-timestamp
                       timestamp)
    bookmark))

(defun tm-bookmark-terse (tm-bookmark)
  "Return \"Compressesed\" string representation of the bookmark.
ATM it's \"tm-name\"-\"el-name\"#\"position\" ..."
  (let* ((el-name (bookmark-prop-get tm-bookmark 'bookmark-el-name))
         (name (if (stringp el-name)
                     el-name
                   "...")))
    (format "%s-%s#%s"
            (bookmark-name-from-full-record tm-bookmark)
            name
            (bookmark-prop-get tm-bookmark 'position))))

;; Bookmark current state functions

;; Bookmark saving and restoring

;; general utility functions

(defun tm-current-time-utc (&optional tz-offset)
  "This function returns standard Emacs (current-time) BUT at UTC.
If TZ-OFFSET is set use TZ-OFFSET seconds as timezone difference from UTC in
stead of the (current-time-zone) setting. Positive (east) or negative (west)
muliples of 3600 make only sense here."
  (let ((offset (if tz-offset
                    tz-offset
                  (car (current-time-zone)))))
    (time-subtract (current-time)
                   (seconds-to-time offset))))

(provide 'threadmachiny)

;; Local Variables:
;; mode: Emacs-Lisp
;; indent-tabs-mode: nil
;; End:

;;; threadmachiny.el ends here

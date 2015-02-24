;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default tab setting indent = 4, use spaces instead of a tab
(setq-default tab-width 4 indent-tabs-mode nil)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

(load-library "php-mode")
(require 'php-mode)
(add-hook 'php-mode-hook
  '(lambda()
    (defun ywb-php-lineup-arglist-intro (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (+ (current-column) c-basic-offset))))
    (defun ywb-php-lineup-arglist-close (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (current-column))))
    (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
    (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)
    (setq tab-width 4)
    (setq indent-tabs-mode nil)
    (setq c-basic-offset 4)))

(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))

(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))

(multi-web-global-mode 1)

(global-set-key "\C-z" 'undo)

;; whitespace
(require 'whitespace)
;(global-whitespace-mode 1)

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(setq whitespace-space-regexp "\\(\u3000+\\)")

;;(set-face-attribute 'whitespace-trailing nil
;;                    :background "DarkYellow"
;;                    :foreground "White")

(set-face-attribute 'whitespace-tab nil
                    :background "Black"
                    :foreground "DarkRed")

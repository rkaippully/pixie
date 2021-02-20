(defun publish-project ()
  (setq org-publish-project-alist
        '(("pixie"
           :base-directory "."
           :publishing-directory "."
           :publishing-function org-html-publish-to-html)))

  (setq org-publish-use-timestamps-flag nil)

  (org-publish-all))

(publish-project)

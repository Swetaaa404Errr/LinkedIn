class ApplyjobMailer < ApplicationMailer

    def new_applyjob(user, cv)

        @cv = cv
        mail(
            to: user.email,
            subject: "New Application for your job",
        )
    end

end

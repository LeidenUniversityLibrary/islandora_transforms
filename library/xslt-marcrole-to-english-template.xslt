<?xml version="1.0" encoding="UTF-8"?>
<!-- Template to get an english string marc role from a marc role code -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="get_english_marcrole">
        <xsl:param name="code"/>
        <xsl:if test="$code = 'abr'">Abridger</xsl:if>
        <xsl:if test="$code = 'acp'">Art copyist</xsl:if>
        <xsl:if test="$code = 'act'">Actor</xsl:if>
        <xsl:if test="$code = 'adi'">Art director</xsl:if>
        <xsl:if test="$code = 'adp'">Adapter</xsl:if>
        <xsl:if test="$code = 'aft'">Author of afterword, colophon, etc.</xsl:if>
        <xsl:if test="$code = 'anl'">Analyst</xsl:if>
        <xsl:if test="$code = 'anm'">Animator</xsl:if>
        <xsl:if test="$code = 'ann'">Annotator</xsl:if>
        <xsl:if test="$code = 'ant'">Bibliographic antecedent</xsl:if>
        <xsl:if test="$code = 'ape'">Appellee</xsl:if>
        <xsl:if test="$code = 'apl'">Appellant</xsl:if>
        <xsl:if test="$code = 'app'">Applicant</xsl:if>
        <xsl:if test="$code = 'aqt'">Author in quotations or text abstracts</xsl:if>
        <xsl:if test="$code = 'arc'">Architect</xsl:if>
        <xsl:if test="$code = 'ard'">Artistic director</xsl:if>
        <xsl:if test="$code = 'arr'">Arranger</xsl:if>
        <xsl:if test="$code = 'art'">Artist</xsl:if>
        <xsl:if test="$code = 'asg'">Assignee</xsl:if>
        <xsl:if test="$code = 'asn'">Associated name</xsl:if>
        <xsl:if test="$code = 'ato'">Autographer</xsl:if>
        <xsl:if test="$code = 'att'">Attributed name</xsl:if>
        <xsl:if test="$code = 'auc'">Auctioneer</xsl:if>
        <xsl:if test="$code = 'aud'">Author of dialog</xsl:if>
        <xsl:if test="$code = 'aui'">Author of introduction, etc.</xsl:if>
        <xsl:if test="$code = 'aus'">Screenwriter</xsl:if>
        <xsl:if test="$code = 'aut'">Author</xsl:if>
        <xsl:if test="$code = 'bdd'">Binding designer</xsl:if>
        <xsl:if test="$code = 'bjd'">Bookjacket designer</xsl:if>
        <xsl:if test="$code = 'bkd'">Book designer</xsl:if>
        <xsl:if test="$code = 'bkp'">Book producer</xsl:if>
        <xsl:if test="$code = 'blw'">Blurb writer</xsl:if>
        <xsl:if test="$code = 'bnd'">Binder</xsl:if>
        <xsl:if test="$code = 'bpd'">Bookplate designer</xsl:if>
        <xsl:if test="$code = 'brd'">Broadcaster</xsl:if>
        <xsl:if test="$code = 'brl'">Braille embosser</xsl:if>
        <xsl:if test="$code = 'bsl'">Bookseller</xsl:if>
        <xsl:if test="$code = 'cas'">Caster</xsl:if>
        <xsl:if test="$code = 'ccp'">Conceptor</xsl:if>
        <xsl:if test="$code = 'chr'">Choreographer</xsl:if>
        <xsl:if test="$code = '-clb'">Collaborator</xsl:if>
        <xsl:if test="$code = 'cli'">Client</xsl:if>
        <xsl:if test="$code = 'cll'">Calligrapher</xsl:if>
        <xsl:if test="$code = 'clr'">Colorist</xsl:if>
        <xsl:if test="$code = 'clt'">Collotyper</xsl:if>
        <xsl:if test="$code = 'cmm'">Commentator</xsl:if>
        <xsl:if test="$code = 'cmp'">Composer</xsl:if>
        <xsl:if test="$code = 'cmt'">Compositor</xsl:if>
        <xsl:if test="$code = 'cnd'">Conductor</xsl:if>
        <xsl:if test="$code = 'cng'">Cinematographer</xsl:if>
        <xsl:if test="$code = 'cns'">Censor</xsl:if>
        <xsl:if test="$code = 'coe'">Contestant-appellee</xsl:if>
        <xsl:if test="$code = 'col'">Collector</xsl:if>
        <xsl:if test="$code = 'com'">Compiler</xsl:if>
        <xsl:if test="$code = 'con'">Conservator</xsl:if>
        <xsl:if test="$code = 'cor'">Collection registrar</xsl:if>
        <xsl:if test="$code = 'cos'">Contestant</xsl:if>
        <xsl:if test="$code = 'cot'">Contestant-appellant</xsl:if>
        <xsl:if test="$code = 'cou'">Court governed</xsl:if>
        <xsl:if test="$code = 'cov'">Cover designer</xsl:if>
        <xsl:if test="$code = 'cpc'">Copyright claimant</xsl:if>
        <xsl:if test="$code = 'cpe'">Complainant-appellee</xsl:if>
        <xsl:if test="$code = 'cph'">Copyright holder</xsl:if>
        <xsl:if test="$code = 'cpl'">Complainant</xsl:if>
        <xsl:if test="$code = 'cpt'">Complainant-appellant</xsl:if>
        <xsl:if test="$code = 'cre'">Creator</xsl:if>
        <xsl:if test="$code = 'crp'">Correspondent</xsl:if>
        <xsl:if test="$code = 'crr'">Corrector</xsl:if>
        <xsl:if test="$code = 'crt'">Court reporter</xsl:if>
        <xsl:if test="$code = 'csl'">Consultant</xsl:if>
        <xsl:if test="$code = 'csp'">Consultant to a project</xsl:if>
        <xsl:if test="$code = 'cst'">Costume designer</xsl:if>
        <xsl:if test="$code = 'ctb'">Contributor</xsl:if>
        <xsl:if test="$code = 'cte'">Contestee-appellee</xsl:if>
        <xsl:if test="$code = 'ctg'">Cartographer</xsl:if>
        <xsl:if test="$code = 'ctr'">Contractor</xsl:if>
        <xsl:if test="$code = 'cts'">Contestee</xsl:if>
        <xsl:if test="$code = 'ctt'">Contestee-appellant</xsl:if>
        <xsl:if test="$code = 'cur'">Curator</xsl:if>
        <xsl:if test="$code = 'cwt'">Commentator for written text</xsl:if>
        <xsl:if test="$code = 'dbp'">Distribution place</xsl:if>
        <xsl:if test="$code = 'dfd'">Defendant</xsl:if>
        <xsl:if test="$code = 'dfe'">Defendant-appellee</xsl:if>
        <xsl:if test="$code = 'dft'">Defendant-appellant</xsl:if>
        <xsl:if test="$code = 'dgg'">Degree granting institution</xsl:if>
        <xsl:if test="$code = 'dgs'">Degree supervisor</xsl:if>
        <xsl:if test="$code = 'dis'">Dissertant</xsl:if>
        <xsl:if test="$code = 'dln'">Delineator</xsl:if>
        <xsl:if test="$code = 'dnc'">Dancer</xsl:if>
        <xsl:if test="$code = 'dnr'">Donor</xsl:if>
        <xsl:if test="$code = 'dpc'">Depicted</xsl:if>
        <xsl:if test="$code = 'dpt'">Depositor</xsl:if>
        <xsl:if test="$code = 'drm'">Draftsman</xsl:if>
        <xsl:if test="$code = 'drt'">Director</xsl:if>
        <xsl:if test="$code = 'dsr'">Designer</xsl:if>
        <xsl:if test="$code = 'dst'">Distributor</xsl:if>
        <xsl:if test="$code = 'dtc'">Data contributor</xsl:if>
        <xsl:if test="$code = 'dte'">Dedicatee</xsl:if>
        <xsl:if test="$code = 'dtm'">Data manager</xsl:if>
        <xsl:if test="$code = 'dto'">Dedicator</xsl:if>
        <xsl:if test="$code = 'dub'">Dubious author</xsl:if>
        <xsl:if test="$code = 'edc'">Editor of compilation</xsl:if>
        <xsl:if test="$code = 'edm'">Editor of moving image work</xsl:if>
        <xsl:if test="$code = 'edt'">Editor</xsl:if>
        <xsl:if test="$code = 'egr'">Engraver</xsl:if>
        <xsl:if test="$code = 'elg'">Electrician</xsl:if>
        <xsl:if test="$code = 'elt'">Electrotyper</xsl:if>
        <xsl:if test="$code = 'eng'">Engineer</xsl:if>
        <xsl:if test="$code = 'enj'">Enacting jurisdiction</xsl:if>
        <xsl:if test="$code = 'etr'">Etcher</xsl:if>
        <xsl:if test="$code = 'evp'">Event place</xsl:if>
        <xsl:if test="$code = 'exp'">Expert</xsl:if>
        <xsl:if test="$code = 'fac'">Facsimilist</xsl:if>
        <xsl:if test="$code = 'fds'">Film distributor</xsl:if>
        <xsl:if test="$code = 'fld'">Field director</xsl:if>
        <xsl:if test="$code = 'flm'">Film editor</xsl:if>
        <xsl:if test="$code = 'fmd'">Film director</xsl:if>
        <xsl:if test="$code = 'fmk'">Filmmaker</xsl:if>
        <xsl:if test="$code = 'fmo'">Former owner</xsl:if>
        <xsl:if test="$code = 'fmp'">Film producer</xsl:if>
        <xsl:if test="$code = 'fnd'">Funder</xsl:if>
        <xsl:if test="$code = 'fpy'">First party</xsl:if>
        <xsl:if test="$code = 'frg'">Forger</xsl:if>
        <xsl:if test="$code = 'gis'">Geographic information specialist</xsl:if>
        <xsl:if test="$code = '-grt'">Graphic technician</xsl:if>
        <xsl:if test="$code = 'his'">Host institution</xsl:if>
        <xsl:if test="$code = 'hnr'">Honoree</xsl:if>
        <xsl:if test="$code = 'hst'">Host</xsl:if>
        <xsl:if test="$code = 'ill'">Illustrator</xsl:if>
        <xsl:if test="$code = 'ilu'">Illuminator</xsl:if>
        <xsl:if test="$code = 'ins'">Inscriber</xsl:if>
        <xsl:if test="$code = 'inv'">Inventor</xsl:if>
        <xsl:if test="$code = 'isb'">Issuing body</xsl:if>
        <xsl:if test="$code = 'itr'">Instrumentalist</xsl:if>
        <xsl:if test="$code = 'ive'">Interviewee</xsl:if>
        <xsl:if test="$code = 'ivr'">Interviewer</xsl:if>
        <xsl:if test="$code = 'jud'">Judge</xsl:if>
        <xsl:if test="$code = 'jug'">Jurisdiction governed</xsl:if>
        <xsl:if test="$code = 'lbr'">Laboratory</xsl:if>
        <xsl:if test="$code = 'lbt'">Librettist</xsl:if>
        <xsl:if test="$code = 'ldr'">Laboratory director</xsl:if>
        <xsl:if test="$code = 'led'">Lead</xsl:if>
        <xsl:if test="$code = 'lee'">Libelee-appellee</xsl:if>
        <xsl:if test="$code = 'lel'">Libelee</xsl:if>
        <xsl:if test="$code = 'len'">Lender</xsl:if>
        <xsl:if test="$code = 'let'">Libelee-appellant</xsl:if>
        <xsl:if test="$code = 'lgd'">Lighting designer</xsl:if>
        <xsl:if test="$code = 'lie'">Libelant-appellee</xsl:if>
        <xsl:if test="$code = 'lil'">Libelant</xsl:if>
        <xsl:if test="$code = 'lit'">Libelant-appellant</xsl:if>
        <xsl:if test="$code = 'lsa'">Landscape architect</xsl:if>
        <xsl:if test="$code = 'lse'">Licensee</xsl:if>
        <xsl:if test="$code = 'lso'">Licensor</xsl:if>
        <xsl:if test="$code = 'ltg'">Lithographer</xsl:if>
        <xsl:if test="$code = 'lyr'">Lyricist</xsl:if>
        <xsl:if test="$code = 'mcp'">Music copyist</xsl:if>
        <xsl:if test="$code = 'mdc'">Metadata contact</xsl:if>
        <xsl:if test="$code = 'med'">Medium</xsl:if>
        <xsl:if test="$code = 'mfp'">Manufacture place</xsl:if>
        <xsl:if test="$code = 'mfr'">Manufacturer</xsl:if>
        <xsl:if test="$code = 'mod'">Moderator</xsl:if>
        <xsl:if test="$code = 'mon'">Monitor</xsl:if>
        <xsl:if test="$code = 'mrb'">Marbler</xsl:if>
        <xsl:if test="$code = 'mrk'">Markup editor</xsl:if>
        <xsl:if test="$code = 'msd'">Musical director</xsl:if>
        <xsl:if test="$code = 'mte'">Metal-engraver</xsl:if>
        <xsl:if test="$code = 'mtk'">Minute taker</xsl:if>
        <xsl:if test="$code = 'mus'">Musician</xsl:if>
        <xsl:if test="$code = 'nrt'">Narrator</xsl:if>
        <xsl:if test="$code = 'opn'">Opponent</xsl:if>
        <xsl:if test="$code = 'org'">Originator</xsl:if>
        <xsl:if test="$code = 'orm'">Organizer</xsl:if>
        <xsl:if test="$code = 'osp'">Onscreen presenter</xsl:if>
        <xsl:if test="$code = 'oth'">Other</xsl:if>
        <xsl:if test="$code = 'own'">Owner</xsl:if>
        <xsl:if test="$code = 'pan'">Panelist</xsl:if>
        <xsl:if test="$code = 'pat'">Patron</xsl:if>
        <xsl:if test="$code = 'pbd'">Publishing director</xsl:if>
        <xsl:if test="$code = 'pbl'">Publisher</xsl:if>
        <xsl:if test="$code = 'pdr'">Project director</xsl:if>
        <xsl:if test="$code = 'pfr'">Proofreader</xsl:if>
        <xsl:if test="$code = 'pht'">Photographer</xsl:if>
        <xsl:if test="$code = 'plt'">Platemaker</xsl:if>
        <xsl:if test="$code = 'pma'">Permitting agency</xsl:if>
        <xsl:if test="$code = 'pmn'">Production manager</xsl:if>
        <xsl:if test="$code = 'pop'">Printer of plates</xsl:if>
        <xsl:if test="$code = 'ppm'">Papermaker</xsl:if>
        <xsl:if test="$code = 'ppt'">Puppeteer</xsl:if>
        <xsl:if test="$code = 'pra'">Praeses</xsl:if>
        <xsl:if test="$code = 'prc'">Process contact</xsl:if>
        <xsl:if test="$code = 'prd'">Production personnel</xsl:if>
        <xsl:if test="$code = 'pre'">Presenter</xsl:if>
        <xsl:if test="$code = 'prf'">Performer</xsl:if>
        <xsl:if test="$code = 'prg'">Programmer</xsl:if>
        <xsl:if test="$code = 'prm'">Printmaker</xsl:if>
        <xsl:if test="$code = 'prn'">Production company</xsl:if>
        <xsl:if test="$code = 'pro'">Producer</xsl:if>
        <xsl:if test="$code = 'prp'">Production place</xsl:if>
        <xsl:if test="$code = 'prs'">Production designer</xsl:if>
        <xsl:if test="$code = 'prt'">Printer</xsl:if>
        <xsl:if test="$code = 'prv'">Provider</xsl:if>
        <xsl:if test="$code = 'pta'">Patent applicant</xsl:if>
        <xsl:if test="$code = 'pte'">Plaintiff-appellee</xsl:if>
        <xsl:if test="$code = 'ptf'">Plaintiff</xsl:if>
        <xsl:if test="$code = 'pth'">Patent holder</xsl:if>
        <xsl:if test="$code = 'ptt'">Plaintiff-appellant</xsl:if>
        <xsl:if test="$code = 'pup'">Publication place</xsl:if>
        <xsl:if test="$code = 'rbr'">Rubricator</xsl:if>
        <xsl:if test="$code = 'rcd'">Recordist</xsl:if>
        <xsl:if test="$code = 'rce'">Recording engineer</xsl:if>
        <xsl:if test="$code = 'rcp'">Addressee</xsl:if>
        <xsl:if test="$code = 'rdd'">Radio director</xsl:if>
        <xsl:if test="$code = 'red'">Redaktor</xsl:if>
        <xsl:if test="$code = 'ren'">Renderer</xsl:if>
        <xsl:if test="$code = 'res'">Researcher</xsl:if>
        <xsl:if test="$code = 'rev'">Reviewer</xsl:if>
        <xsl:if test="$code = 'rpc'">Radio producer</xsl:if>
        <xsl:if test="$code = 'rps'">Repository</xsl:if>
        <xsl:if test="$code = 'rpt'">Reporter</xsl:if>
        <xsl:if test="$code = 'rpy'">Responsible party</xsl:if>
        <xsl:if test="$code = 'rse'">Respondent-appellee</xsl:if>
        <xsl:if test="$code = 'rsg'">Restager</xsl:if>
        <xsl:if test="$code = 'rsp'">Respondent</xsl:if>
        <xsl:if test="$code = 'rsr'">Restorationist</xsl:if>
        <xsl:if test="$code = 'rst'">Respondent-appellant</xsl:if>
        <xsl:if test="$code = 'rth'">Research team head</xsl:if>
        <xsl:if test="$code = 'rtm'">Research team member</xsl:if>
        <xsl:if test="$code = 'sad'">Scientific advisor</xsl:if>
        <xsl:if test="$code = 'sce'">Scenarist</xsl:if>
        <xsl:if test="$code = 'scl'">Sculptor</xsl:if>
        <xsl:if test="$code = 'scr'">Scribe</xsl:if>
        <xsl:if test="$code = 'sds'">Sound designer</xsl:if>
        <xsl:if test="$code = 'sec'">Secretary</xsl:if>
        <xsl:if test="$code = 'sgd'">Stage director</xsl:if>
        <xsl:if test="$code = 'sgn'">Signer</xsl:if>
        <xsl:if test="$code = 'sht'">Supporting host</xsl:if>
        <xsl:if test="$code = 'sll'">Seller</xsl:if>
        <xsl:if test="$code = 'sng'">Singer</xsl:if>
        <xsl:if test="$code = 'spk'">Speaker</xsl:if>
        <xsl:if test="$code = 'spn'">Sponsor</xsl:if>
        <xsl:if test="$code = 'spy'">Second party</xsl:if>
        <xsl:if test="$code = 'srv'">Surveyor</xsl:if>
        <xsl:if test="$code = 'std'">Set designer</xsl:if>
        <xsl:if test="$code = 'stg'">Setting</xsl:if>
        <xsl:if test="$code = 'stl'">Storyteller</xsl:if>
        <xsl:if test="$code = 'stm'">Stage manager</xsl:if>
        <xsl:if test="$code = 'stn'">Standards body</xsl:if>
        <xsl:if test="$code = 'str'">Stereotyper</xsl:if>
        <xsl:if test="$code = 'tcd'">Technical director</xsl:if>
        <xsl:if test="$code = 'tch'">Teacher</xsl:if>
        <xsl:if test="$code = 'ths'">Thesis advisor</xsl:if>
        <xsl:if test="$code = 'tld'">Television director</xsl:if>
        <xsl:if test="$code = 'tlp'">Television producer</xsl:if>
        <xsl:if test="$code = 'trc'">Transcriber</xsl:if>
        <xsl:if test="$code = 'trl'">Translator</xsl:if>
        <xsl:if test="$code = 'tyd'">Type designer</xsl:if>
        <xsl:if test="$code = 'tyg'">Typographer</xsl:if>
        <xsl:if test="$code = 'uvp'">University place</xsl:if>
        <xsl:if test="$code = 'vac'">Voice actor</xsl:if>
        <xsl:if test="$code = 'vdg'">Videographer</xsl:if>
        <xsl:if test="$code = '-voc'">Vocalist</xsl:if>
        <xsl:if test="$code = 'wac'">Writer of added commentary</xsl:if>
        <xsl:if test="$code = 'wal'">Writer of added lyrics</xsl:if>
        <xsl:if test="$code = 'wam'">Writer of accompanying material</xsl:if>
        <xsl:if test="$code = 'wat'">Writer of added text</xsl:if>
        <xsl:if test="$code = 'wdc'">Woodcutter</xsl:if>
        <xsl:if test="$code = 'wde'">Wood engraver</xsl:if>
        <xsl:if test="$code = 'win'">Writer of introduction</xsl:if>
        <xsl:if test="$code = 'wit'">Witness</xsl:if>
        <xsl:if test="$code = 'wpr'">Writer of preface</xsl:if>
        <xsl:if test="$code = 'wst'">Writer of supplementary textual content</xsl:if>
    </xsl:template>
</xsl:stylesheet>
